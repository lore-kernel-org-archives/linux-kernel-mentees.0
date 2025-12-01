Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309212868A9
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  1 Dec 2025 20:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764621463; cv=none; b=K7ouMmDTVOvK9h4zRWw+77l6cS9pvCiaiWmSM5xkj18N+9nZAC8AvhsUtX8/FkmY3lzTcgvjSCR/OIXGYBOnPrlPv3DIq77sfjBCZFEo0GHR89VwdBOeezZTCEgACpGZ1PXVO2G1ZG50TYp1S08Xa8qnSX2NZ5bxdv+vLixtB/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764621463; c=relaxed/simple;
	bh=HV83Y8jNILcsVoeAeEISwDwWVyNwvsbim/+VE/epq9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pw4fmnh0UyHAwMK8CKTJ8u4o796qz6WtJZLWpaFIerUw+s0Pnb3q66oiTRLsUU+4nZsL95TEiOFqBQMVnjda2lCf5Yhrcm37jxojTcsxmGVESAHuGn7hPgXDrY+gsc8GGZt89EKdPUTgfVubV4/6kGLXAlJvQHOo6+H/lledoxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BuP14eHT; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuP14eHT"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3437af8444cso5497792a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 01 Dec 2025 12:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764621461; x=1765226261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMFinDzf12DskrYWTn3hquLiDv906s1+ITYvei0aZ1A=;
        b=BuP14eHTPZxRajOKQmQiAs1HJgHO9U3uAlOANMvqTtf22yaymH4xQkNiFkwny6Djhm
         k1HBMXgiiK++fbnHO77WcjZIZadeuHCTArUrliznF6aneIsRI3sYTyp9v8D4coy25sO1
         Oh+ytZTQqO95RB/vAPXhM5IsFUPNyw3I0mn0SrdWpSuoaznh9kvM8edqG6UFiEk7VOH2
         kSxz3cxXtlF4Zggz0BRAjm2m3CSOog+3j+658rDVaCBsgsJ2TNEtGdWLIcRWWVKZi794
         Guk8beeTErVI8pME3qD3alwbEZIyw/OnQRyKakwq6NqmsfOW9WWa7OUU/7oR+CasXT8S
         DmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764621461; x=1765226261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HMFinDzf12DskrYWTn3hquLiDv906s1+ITYvei0aZ1A=;
        b=mtoJUpEAOsS/AfKrBSnOkauYlIuq/i8nZQJqZKjpGJmGyzAygvFBY51+hsGuSjA6B5
         sUYEaAvfJ65UlHcAhfcV0Bs9gonevrJyL+SjWxlc/S4YYlZUibHcQxBbpr7aH/FEIP/n
         aWqiErzjsGHgDhr86v8qv26uKfiXlDxqtuwq/sPoMOXp5RckU/R7UPeA0TlJxE6P8iYg
         kOihNuLTBp99F0YEyKG9y5ortoooTwpHxNpBByIRiOPhl+U8wgONIkzl8asQh+KzECHl
         0z9Z59JfVuUl00bdrKzKk/6JMzJfs3WZH2YJi2UHNb2fBggSrQX31yRKTCEp5izE3HpO
         Kgdg==
X-Forwarded-Encrypted: i=1; AJvYcCXWDc2O+aVAv35Kw76L9mrH0431jxstAnWNmknGMgJ7oPN1eWwRncuFPF8ayYNXOJ7kRQxqqBXcYzoPiv+PtxtFeBd1jw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd3AwEKdVMc1d8EICsw+Ao2LUBygIQOe16gyhDJrTl9XQguxOM
	kE/pdOCBAtpRltF2jmQLlml33UzziIOhIUfPebaoffjPK8jcXVbOifQp
X-Gm-Gg: ASbGncsrSxHIBlX0BrW/aV9XKhPjuLcyY7+p26MtmlF6Ra8Q+fM4FGCTKfcaMoM7qfX
	ccBORxF91XpqKA+IB4PYg6Gbb/JFuKQYENMhngRHgmW+Qp+Ff8FpCzXf7KfV93r3+cD+Lc/DYL6
	n0pbTm+SrGu6bP8FjKbqtmsL6bVCerKybtCT47m+li3yBS0b9o8FYeNRGONd2mUgQiVBMpcnNDK
	UwP0JdXovGY4RhVaReieWwJdaZQSQ4HEmj4FGLjiMzpVgca9duX8qGtzg9pUscq/aXitGecuQpE
	9kzp8Kit3+ZWmJgTDlPnhzOZEnNqK74BBhoRjUQBX7NWNVbVenMdBwaPpxxSR1GhWhe4iWXfPwj
	qsyNOXQ/g7shEBAuRFPe32vIL4G6/wdtgG/lUy0cPNpMrh6vGEswAcT4cLFLF3KsqtA/2XZ+DO4
	mu9hpIRDSRLNr6uT7Xb3qL8TdU1cDLPQ0Gdjk=
X-Google-Smtp-Source: AGHT+IGy5roLh99dzfWSGIMY/TD3KRw3HUxv9eVTSnT6FUeNG1+/rruLpyAViKSztrwT/rheUxgTHw==
X-Received: by 2002:a17:90b:534e:b0:341:a9e7:e5f9 with SMTP id 98e67ed59e1d1-34733d76c4dmr34752993a91.0.1764621461476;
        Mon, 01 Dec 2025 12:37:41 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.177.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fb248be1sm13113892a12.3.2025.12.01.12.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 12:37:41 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH v2 4/6] usb: gadget: dummy_hcd: use sizeof(*ptr) instead of sizeof *ptr
Date: Tue,  2 Dec 2025 02:07:13 +0530
Message-ID: <20251201203715.17768-5-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201203715.17768-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251201203715.17768-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 'sizeof(*ptr)' instead of 'sizeof *ptr' to follow kernel coding style.
This improves readability and maintains consistency across the code.
---
 drivers/usb/gadget/udc/dummy_hcd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index e4124838e..cbf9dbf2a 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1258,7 +1258,7 @@ static int dummy_urb_enqueue(
 	unsigned long	flags;
 	int		rc;
 
-	urbp = kmalloc(sizeof *urbp, mem_flags);
+	urbp = kmalloc(sizeof(*urbp), mem_flags);
 	if (!urbp)
 		return -ENOMEM;
 	urbp->urb = urb;
@@ -2066,7 +2066,7 @@ static struct {
 static inline void
 ss_hub_descriptor(struct usb_hub_descriptor *desc)
 {
-	memset(desc, 0, sizeof *desc);
+	memset(desc, 0, sizeof(*desc));
 	desc->bDescriptorType = USB_DT_SS_HUB;
 	desc->bDescLength = 12;
 	desc->wHubCharacteristics = cpu_to_le16(
@@ -2079,7 +2079,7 @@ ss_hub_descriptor(struct usb_hub_descriptor *desc)
 
 static inline void hub_descriptor(struct usb_hub_descriptor *desc)
 {
-	memset(desc, 0, sizeof *desc);
+	memset(desc, 0, sizeof(*desc));
 	desc->bDescriptorType = USB_DT_HUB;
 	desc->bDescLength = 9;
 	desc->wHubCharacteristics = cpu_to_le16(
-- 
2.43.0

