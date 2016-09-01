/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.expert.database.utilities;
import org.springframework.core.io.ByteArrayResource;

public class FileMessageResource extends ByteArrayResource{

	 /**
     * The filename to be associated with the {@link MimeMessage} in the form data.
     */
    private final String filename;

    /**
     * Constructs a new {@link MimeMessageRe
     * @param byteArray A byte array containing data from a {@link MimeMessage}.
     * @param filename The filename to be associated with the {@link MimeMessage} in
     * 	the form data.
     */
    public FileMessageResource(final byte[] byteArray, final String filename) {
        super(byteArray);
        this.filename = filename;
    }

    @Override
    public String getFilename() {
        return filename;
    }
}