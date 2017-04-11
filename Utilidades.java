package br.com.srctreinamentotecnologico.sgcintegrado.utilidades;

import java.awt.Color;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.InputMismatchException;

import javax.swing.JFormattedTextField;
import javax.swing.JTextField;

public abstract class Utilidades{
	
	public static boolean matchesOnlyText(String text) {
	    return text.matches("[^\\d]+"); //Passa para o método matches a regex
	    //Se tiver número na string irá retornar falso
	    //Note o uso de duas \\, uma sendo obrigatória para servir de caracter de escape
	}
	
	
	//valida se for string
	public static boolean validaString(String str) {
        return str.matches("[a-zA-Z0-9]+");
    }
	
	
	
	public Date dataF(String data) {
        if (data == null) {
            return null;
        }
        Date dataF = null;
        try {
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            long tempo = dateFormat.parse(data).getTime();
            dataF = new Date(tempo);
        } catch (ParseException pe) {
            System.out.println("deu erro na conversão");
        }
        return dataF;
    }

	


	
	public static Date parseDate( String data, String mascara ) throws ParseException {
		if ( data != null && !"".equals( data ) ) {
			SimpleDateFormat dateFormat = new SimpleDateFormat();

			if ( mascara != null && !"".equals( mascara ) && data.length() > 10 ) {
				dateFormat.applyPattern( mascara );
			} else {
				dateFormat.applyPattern( "dd/MM/yyyy" );
			}

			dateFormat.setLenient( false );
			return dateFormat.parse( data );
		}

		return null;
	}

	public static String parseDate( Date data, String mascara ) throws ParseException {
		if ( data != null ) {
			SimpleDateFormat dateFormat = new SimpleDateFormat();

			if ( mascara != null && !"".equals( mascara ) ) {
				dateFormat.applyPattern( mascara );
			} else {
				dateFormat.applyPattern( "dd/MM/yyyy" );
			}

			dateFormat.setLenient( false );
			return dateFormat.format( data ); // <-- O format é o que difere do outro método.
		}

		return null;
	}

	public static boolean isNuloOuVazio( Object valor ) {
		if ( valor instanceof String ) {
			String string = (String) valor;
			if ( string == null || string.isEmpty() ) {
				return true;
			}
		} else if ( valor instanceof ArrayList ) {
			ArrayList arrayList = (ArrayList) valor;
			if ( arrayList == null || arrayList.isEmpty() ) {
				return true;
			}
		} else if ( valor instanceof HashSet ) {
			HashSet setList = (HashSet) valor;
			if ( setList == null || setList.isEmpty() ) {
				return true;
			}
		} else {
			return valor == null;
		}

		return false;
	}

	public static void validarCampoData( JTextField data ) {
		if ( data.getText() != null && !data.getText().replace( "/", "" ).trim().isEmpty() ) {
			try {
				SimpleDateFormat df = new SimpleDateFormat( "dd/MM/yyyy" );
				df.setLenient( false );
				df.parse( data.getText() );

				data.setForeground( Color.BLACK );
			} catch ( ParseException e ) {
				data.setForeground( Color.RED );
				data.requestFocus();
			}
		} else {
			( (JFormattedTextField) data ).setValue( "" );
			data.setForeground( Color.BLACK );
		}
	}
	

	public static void validarCampoCPF( JTextField cpf ) {
		if ( cpf.getText() != null && !cpf.getText().replace( ".", "" ).replace( "-", "" ).trim().isEmpty() ) {
			if ( isCpfValido( cpf.getText().replace( ".", "" ).replace( "-", "" ) ) ) {
				cpf.setForeground( Color.BLACK );
			} else {
				cpf.setForeground( Color.RED );
				cpf.requestFocus();
			}
		} else {
			( (JFormattedTextField) cpf ).setValue( "" );
			cpf.setForeground( Color.BLACK );
		}
	}

	public static boolean isCpfValido( String CPF ) {
		// considera-se erro CPF's formados por uma sequencia de numeros iguais 
		if ( CPF.equals( "00000000000" ) || CPF.equals( "11111111111" ) || CPF.equals( "22222222222" ) || CPF.equals( "33333333333" ) || CPF.equals( "44444444444" ) || CPF.equals( "55555555555" ) || CPF.equals( "66666666666" ) || CPF.equals( "77777777777" ) || CPF.equals( "88888888888" ) || CPF.equals( "99999999999" ) || ( CPF.length() != 11 ) ) {
			System.out.println("cpf invalido" + CPF);
			return (  false );
		}
		char dig10, dig11;
		int sm, i, r, num, peso;
		// "try" - protege o codigo para eventuais erros de conversao de tipo (int)
		try {
			// Calculo do 1o. Digito Verificador 
			sm = 0;
			peso = 10;
			for ( i = 0; i < 9; i++ ) {
				// converte o i-esimo caractere do CPF em um numero: 
				// por exemplo, transforma o caractere '0' no inteiro 0 
				// (48 eh a posicao de '0' na tabela ASCII) 
				num = (int) ( CPF.charAt( i ) - 48 );
				sm = sm + ( num * peso );
				peso = peso - 1;
			}
			r = 11 - ( sm % 11 );
			if ( ( r == 10 ) || ( r == 11 ) ) {
				dig10 = '0';
			} else {
				dig10 = (char) ( r + 48 );
			}
			// converte no respectivo caractere numerico 
			// Calculo do 2o. Digito Verificador 
			sm = 0;
			peso = 11;
			for ( i = 0; i < 10; i++ ) {
				num = (int) ( CPF.charAt( i ) - 48 );
				sm = sm + ( num * peso );
				peso = peso - 1;
			}
			r = 11 - ( sm % 11 );
			if ( ( r == 10 ) || ( r == 11 ) ) {
				dig11 = '0';
			} else {
				dig11 = (char) ( r + 48 );
			}
			// Verifica se os digitos calculados conferem com os digitos informados. 
			if ( ( dig10 == CPF.charAt( 9 ) ) && ( dig11 == CPF.charAt( 10 ) ) ) {
				return ( true );
			} else {
				return ( false );
			}
		} catch ( InputMismatchException erro ) {
			return ( false );
		}

	}
		 
	
}
