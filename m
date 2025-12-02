Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5703245019
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  2 Dec 2025 06:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764657484; cv=none; b=nCkCjPXA5dGqEOz2IIWW9aoQ5HwOCnYJhnOuq1BieFAWDHVgzL89A9rOre8eEUUUHCQmOsly8OScaKsyXSts+mWH0LOWx5Pq6dWUqBaRTE7/Tj+OR+gY+ob/OneDvKuUnsCbNPTD5YBtZx8dfMtbx6kDP6k6i79a2E965PR2V9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764657484; c=relaxed/simple;
	bh=sstyFnMpYZQBdS1AqfURxxfI/z4kR/FGE9dNT0lzCwY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Kn7Kr2yCjZOgsrA/tRjG74XPdUYZlQ3g9+/JYKvQsph69C8YZMyzhwieWLSLxbRwLRAItCFiYqbvSrb2HLKAf/nGqlLxGjGrHQ133+QNYWrrkcAtqDR0XhK9aUcXSx1T3h/IuAQs2JxSHg+Q3SNrT0ZkYvTWUpsWriKgOixeoWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwErwBz9; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwErwBz9"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b77030ffad9so602201466b.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 01 Dec 2025 22:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764657481; x=1765262281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xU/ehQzgoy5IJfNnWDZeimYkIusU+phaEXEPKsptZaA=;
        b=XwErwBz90h5rYuiZkAwy1IRF9ylpO0xfzkfRw/UuFp2nrE/YymSQorZR0cOW7UhqAF
         u22ILXlcwxpdCqW69zVAISAMaR+Bhf+Evlb2IfW79K7MULYKMREC9pS2xw3NTLS1k1Ng
         8K+ieRR/QpAbFS5LKSPO68YLcA3f/N42CTKVMVWj3jG1BeVFKvPb+tWCfbS+hWbgTBxU
         mm4LV0eeOFJt2zsItduNj7Zgut/0Yo/fcZ0hgcKW7s9oWHMm+U4O4DxlwDNMeyctoWeJ
         2CTlyCG+Q1ynKFULa+GY3UhWrSZt+7HDEk3MdwlhrbwuJkrc2QuNSydVo2ZiUbtI2/im
         2oJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764657481; x=1765262281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xU/ehQzgoy5IJfNnWDZeimYkIusU+phaEXEPKsptZaA=;
        b=rjR1+nQcQ9xVC/4EX+cZpGTsHDZYPpSnrnFv7dsKbFU4CTj3mnkTLFJnxy0D+jt6ET
         NgTBzYl7oPtJzxRETGm5KGTuiIvMjcjOqfzWCLQvmRcnlfOYKD4h+AjN0OwGX6+MvO9V
         jj8ToNjBBbzwr4Ht2+Zxx3RMuU3IjsCUWZms3+cxnpNVLvXC26jEWsfg7Wg+USBH4rJP
         JSmvl2MBW1QDstJazadO/jVAkhEdtE8hO2c9hl/Xpp4aw5HKYyj5jEN+AFeYuRywHIxq
         Ol9Wi6ejhppxdBRLE4/CLPW5hlDMw3m/MHuxMP9XIHYeDby0dTE8SyrL9iDEgoYGbMol
         FMsg==
X-Forwarded-Encrypted: i=1; AJvYcCXLl6RGHCSd0fg6nty383YkBY7ikW1v0NOOkVP8d0Wvq7Lc+o93zdISBv35IggGeTXlKDlHRpldq2fVm5MX3Hx0KRG2Dg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzkXziqQWc1yxPxwHydE+kXXAmO+TznU40CHLUTOQ2rOBl/YP/n
	9+/W3jAN+81ZQV5FcjcXd8urLyqQpUNfeW8PNypPJ5BwDrYcTTpkf65W
X-Gm-Gg: ASbGncuNW83/SPK0aEwf/0jG0t6J4Alm9E47WkhI2174I3rKWTVf9TVac6guNlU+k87
	LhulJuTXLZJQGMWPV+JzUt3ShA/EtzmKIs/N9oOZFYYpv+IpBR1C1WX68Mn8R4+V6FU+q5Shmo6
	/FM8bzKrYyQIz0TXc8WiElx5sOksA5/YlJsVE7tTQZ+y89qYBlpmmX3liYpeP5413ObAtJUljF6
	TmgHLsNPSg0Y4rZjBHias7BGi1NFdDISwQC552R0S3EjFe7G4BN/4xV9QjQ16GbSFIij2rXKpQH
	Xo93ZVQ86+FVaM7Fd3PKo/XyNoVdbvmFCGGzYM4OWsTifStmPjSPX83487Yd4pkC3OwNHlSeP9U
	Xd8p/cYG7vOmIclXWAsoVNmV4EsXzlNZKRGDr7PigCnw1saj4GQH+UF3bwqWQ3xYQijB3MTBAvK
	mdSe1T09oKNi29TUHzpUEyF9IlWjMyGYIfEGd0YPiws1b+DxGDcDZrtSsnYBpfVRvo118svCV8H
	xYF9IaRM+h5EKRz6Ea/z8hKyul/u1Q531tfJbl8GXvpOI/g4wENbzju
X-Google-Smtp-Source: AGHT+IFeKQHPFGG+303VAn1mYEbLpCoJtv6qFCVlVACUY4E4EYVg0dNCagka16l8BXssZYkp3qVq3A==
X-Received: by 2002:a17:907:9489:b0:b73:5acd:4650 with SMTP id a640c23a62f3a-b76717016dcmr4366330666b.23.1764657480838;
        Mon, 01 Dec 2025 22:38:00 -0800 (PST)
Received: from localhost.localdomain (user-5-173-222-11.play-internet.pl. [5.173.222.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5162d26sm1433035366b.3.2025.12.01.22.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 22:38:00 -0800 (PST)
From: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
To: gregkh@linuxfoundation.org
Cc: jirislaby@kernel.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
Subject: [PATCH] tty/n_hdlc: Fix struct n_hdlc kernel-doc warnings
Date: Tue,  2 Dec 2025 07:37:48 +0100
Message-Id: <20251202063748.1210359-1-kubik.bartlomiej@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing descriptions for write_work and tty_for_write_work
members in struct n_hdlc.

This fixes the following warnings:
drivers/tty/n_hdlc.c: warning: Function parameter or member
  			       'write_work' not described in 'n_hdlc'
drivers/tty/n_hdlc.c: warning: Function parameter or member
  			       'tty_for_write_work' not described in 'n_hdlc'

Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
---
 drivers/tty/n_hdlc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/n_hdlc.c b/drivers/tty/n_hdlc.c
index 4a4dc58b866a..ac0605ac9d46 100644
--- a/drivers/tty/n_hdlc.c
+++ b/drivers/tty/n_hdlc.c
@@ -127,6 +127,8 @@ struct n_hdlc_buf_list {
  * @rx_buf_list: list of received frame buffers
  * @tx_free_buf_list: list unused transmit frame buffers
  * @rx_free_buf_list: list unused received frame buffers
+ * @write_work: work struct for deferred frame transmission
+ * @tty_for_write_work: pointer to tty instance used by the @write_work
  */
 struct n_hdlc {
 	bool			tbusy;
--
2.39.5

