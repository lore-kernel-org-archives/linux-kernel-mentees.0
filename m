Return-Path: <SRS0=nM8m=Y7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_IMAGE_ONLY_08,HTML_IMAGE_RATIO_06,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5761FA372C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Nov 2019 01:59:08 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 960652178F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Nov 2019 01:59:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVXdGXnA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 960652178F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5D1C6B8F;
	Thu,  7 Nov 2019 01:59:08 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2C2EBAE7
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  7 Nov 2019 01:59:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
	[209.85.219.50])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C3EB0189
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  7 Nov 2019 01:59:06 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id c9so195362qvz.9
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 06 Nov 2019 17:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:message-id:subject:mime-version;
	bh=Wt9JkPOd+alVN29j/NJPl3ky98A7rAvlvpTN2Tff3UQ=;
	b=YVXdGXnA6wprmzl5vXecCxN3q5H1IPJckUHGCApBpQuBN5R5XI0yCXrBnCT4hm3d0E
	mtTDkcBA7NeWwOXmyVKpc/kuW0JvjzX2h1II69fAicG4HnPNklaw8mF0F1nRi3kR5tEc
	mWuLyScjPnOm07Zm0cUpMniZVFhDHiSal+S/QvcooB0XuuB0gB3RnwyLn3xsZut5kcPO
	iSpf+Hsi2jyqIjOEKluiYjpab68RRY2QliXL4T22HRFHlQa5fmeyXqYqONi30c6rw7j3
	I/Xi4ZY/0gYuUw5Tukgnt/u3UsAlkqH5Gy1cyTdUP5d3e4PLqeGtyg5PXgoUDUHg8Q8Z
	moqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:message-id:subject:mime-version;
	bh=Wt9JkPOd+alVN29j/NJPl3ky98A7rAvlvpTN2Tff3UQ=;
	b=bgj+mmwcBpeZOh+fNp2bAOzEBl9GlLVenVvmg4JnEUyzAkQrpewvWZuOmQZ28vhNPh
	uzFMSQ/0SW4cokK6DNbeY/5E5tEdjUryiMR/Oj96IczY/LC40vybm+v6FYi7FvWF8yhg
	ACZxW76Sjz1+p1h6AnsmXCZvRMuTLl2S59l6/FfWOhl8ubVzN8OBBZc6Xo+I9B/A7n5u
	Z9wbwscR9yBYI+zfkUc6vWdWBjYoVTAscP2UVBIVjlPqY3T7u0OPJsf62bjmAz6O9+uO
	oEXe4J6J1fZ7VG2IffpPA1cGVkR0774Dwrh6OC2TkF7apY8YQ6OU8Gq0Fm0m7qy0A7HU
	shBg==
X-Gm-Message-State: APjAAAUtvvEdp5h0TSWuGqLHvtzSDEoVNqtTOWxKD6exvp860eODjGeI
	XVMuzbLdodgXN/h/m2PWTZjT6NpaGMH3IQ==
X-Google-Smtp-Source: APXvYqzAM4xav+MKECAxaC7OM0GUiMTKVrw3iVjpCANlxLF4zZoqvdI8EpR7UCcFCtve1QBUxCs9tg==
X-Received: by 2002:a0c:94d7:: with SMTP id k23mr1115562qvk.200.1573091945539; 
	Wed, 06 Nov 2019 17:59:05 -0800 (PST)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
	by smtp.gmail.com with ESMTPSA id 27sm844859qtu.71.2019.11.06.17.59.04
	for <linux-kernel-mentees@lists.linuxfoundation.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Nov 2019 17:59:05 -0800 (PST)
Date: Wed, 6 Nov 2019 22:51:56 -0300
From: Daniel Lima de Almeida <dwlsalmeida@gmail.com>
To: "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?="
	<linux-kernel-mentees@lists.linuxfoundation.org>
Message-ID: <1EAC4E5D-F15C-4F29-A9D8-24D42EE212CF@getmailspring.com>
X-Mailer: Mailspring
MIME-Version: 1.0
Subject: [Linux-kernel-mentees] I am working on converting
	Documentation/DMA-API.txt to .rst
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8607952789805903960=="
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

--===============8607952789805903960==
Content-Type: multipart/alternative; boundary="5dc378bc_fb5f023_edf"

--5dc378bc_fb5f023_edf
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hello everyone!
After checking the logs for this mailing list I was unable to locate patches to convert Documentation/DMA-API.txt to reStructuredText, therefore I am working on that now.
Thank you.
--5dc378bc_fb5f023_edf
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<br><div>Hello everyone=21</div><br><div>After checking the logs for this=
 mailing list I was unable to locate patches to convert Documentation/DMA=
-API.txt to reStructuredText, therefore I am working on that now.</div><b=
r><div>Thank you.</div><img class=3D=22mailspring-open=22 alt=3D=22Sent f=
rom Mailspring=22 width=3D=220=22 height=3D=220=22 style=3D=22border:0; w=
idth:0; height:0;=22 src=3D=22https://link.getmailspring.com/open/1EAC4E5=
D-=4615C-4=4629-A9D8-24D42EE212C=46=40getmailspring.com=3Fme=3D685996c6&a=
mp;recipient=3DbGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZG=460aW9u=
Lm9yZw%3D%3D=22>
--5dc378bc_fb5f023_edf--


--===============8607952789805903960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8607952789805903960==--

