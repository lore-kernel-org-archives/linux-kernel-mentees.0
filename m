Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E017263D
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 23 Jun 2025 14:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687850; cv=none; b=LoBu+4qDQhzTc747w0mpOSbOFoxAgrpYZreK4BMxwCiFEurK/0pbp+JlhXSXvRvc72ppEo8VuV/5FG10LZa4CLdfKqo0bDDrlrzJu+CYNQ4m+T1xEXFmzRmazBV/qg9tubDlPDSSouJNAokIffdG29M++XdW73HODWoJ68FODUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687850; c=relaxed/simple;
	bh=nIC8FW1qrw909l8wvSt3cY7s7lffa33yp1Dh6OvbuR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j5lP/nl0CD/+FayFAHJ01l6Np8LK7JenKgdZPpKzhVMMimbmxfbskSEJwm2KhdmE5yyE9JDjjJPeAFJytFOWcETiA15WXsaPWHnfOUuYOe6DE5E2VWZqloasGxLufQv6Pt8d0QioqvgVBl8s8MepEIWV33Wv67YZ8UWrRd9d9Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=VKaMc2dD; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="VKaMc2dD"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so29085485e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 23 Jun 2025 07:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1750687845; x=1751292645; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lcv5YPu7e8CB/TGgk0GJfc6Wc4FUmKBKEj6aqoim6Y0=;
        b=VKaMc2dDIgHGnduizCvgs/Z8AcdftBtxeKRx2wicRc4X3A7QACbqyckCbyMmiLpKUn
         TmvLxhR7j/Car8YgYNa6yLycODWsWfQqo4WBh8v0ZCDnL+s+SR0QktDG9Nbm9QdKhjTM
         gU2WpajyFr5M1G5FfJkX5zrrRu3JB65kachwnDjbKVZOZT4J+e2VRs5Oki6OdSzdLkkd
         PbMAtbnm/4E7/nPdC09DlpxV9q6ko7YIM51TLoFptmA0E8l+lg0hK/9koiTW3/1IAO42
         vBTlLRkaWK19IfreqVyW0vr8jbAjBngH+1QpxY4Gf5WIsPX6+X4vNf4dzruBG7yq3Gl/
         W3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687845; x=1751292645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lcv5YPu7e8CB/TGgk0GJfc6Wc4FUmKBKEj6aqoim6Y0=;
        b=sKeeQiQwyQyEklvitDbMzmkMNCGcE/0+bhdnXy3erDZsrnKng8LSRuoWDtpA2u4pv+
         ru5+DbYquKW6KunNhL2L8/9eRo3LbNpvxlzPVImB4q98sJBIEeULMa+sk42AoXJLPRft
         udUnDX89J771UWzo2or1zCP5AXjMbTN0GfjFJLbxT4VFF7SNt9x+K0tR0jpBT5eo7ime
         bXAADnUlWU6g3egPprJsXdk7vjdXLCsr+RR8AsH6ILDhrYS0/3KKo535bOvremgKxqHH
         Rie/G2lIKk05sU2luw+yYHho2N+PYHhYA5xlvx4GTl+TYMLKsNIr7fQTC9pdSMeJ7N1p
         PJ6A==
X-Forwarded-Encrypted: i=1; AJvYcCU+D7eY7GLuKCPGFdw95TWQmScJjScBc8DXi4TKeOresPBbjGeWMOUYi2vm6ngXFhRbZRw4WmPbISTnhYSaZ1inWNm5IA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFgpzvd9Z3cSN5jSOK9pm9irPr2+nsylijWJ+Il2YRhkUe2Pep
	KG8aQexDWUkFyZgLKId195Ct2lUIXfr/SgF6Gda9hSZRPgAhEGN8iOIOG8/S9zkO2I+uvR0V6HX
	MOZPqAV8=
X-Gm-Gg: ASbGnctECsxEnN1yZ02YDNwa5osNWioxvCo0UdSF/q18+oLKDx1muktYFhPtX58dJ7q
	XSTE33UCe0nxUH5kcrCXP9+y1JBpvitjUVhUaU9qYO5joS4QDHu1wn+fhtLvPG12Rpjof1cy3KF
	hpHrFr2gExzTUcLHc/X0DuQXxnVOguDHUKjsPMUAJ9SslgiuHJkI2ZGllCEqoTr52JKPya5hjJ9
	kbDJQgkwlPLPSJtAc2LAah/I7h244cLLRoxOO1rWBhybeXFdwKWVKks3dTyBL0cuZps0jkJRRbi
	Z8Xo1oMLPBE2ODbMRIy94lGThx8EBR5fQW2Swmf2XwLvmom969cqgS+TJVcUXcLlrpkzoe1EHN/
	lCj6YVGUcnUIisavnliOjQCmW
X-Google-Smtp-Source: AGHT+IHu8ThU4fWbJ971kUhXyTgqaaI7W/xvc9ZVSFaTQKtizCrSIiXqe5WNuEKSna35IWIMP6agnw==
X-Received: by 2002:a05:600c:871b:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-453659d0a9bmr130173895e9.15.1750687845066;
        Mon, 23 Jun 2025 07:10:45 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:8310:8165:973c:45af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c02fsm9695584f8f.50.2025.06.23.07.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:10:44 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: christophe.jaillet@wanadoo.fr,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v2] usb: ehci: replace scnprintf() with sysfs_emit()
Date: Mon, 23 Jun 2025 16:09:50 +0200
Message-ID: <20250623140950.61568-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per Documentation/filesystems/sysfs.rst, show() methods should only
use sysfs_emit() or sysfs_emit_at() when formatting values to be
returned to userspace.

Convert the uses of scnprintf() in sysfs show() methods to
sysfs_emit() and sysfs_emit_at() for better safety and consistency.

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
Changes in v2:
 - Removed unnecessary curly braces as per style guidelines

 drivers/usb/host/ehci-sysfs.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/ehci-sysfs.c b/drivers/usb/host/ehci-sysfs.c
index 8f75cb7b197c..5e6b545c30e6 100644
--- a/drivers/usb/host/ehci-sysfs.c
+++ b/drivers/usb/host/ehci-sysfs.c
@@ -12,21 +12,17 @@ static ssize_t companion_show(struct device *dev,
 			      char *buf)
 {
 	struct ehci_hcd		*ehci;
-	int			nports, index, n;
-	int			count = PAGE_SIZE;
-	char			*ptr = buf;
+	int			nports, index;
+	int			len = 0;
 
 	ehci = hcd_to_ehci(dev_get_drvdata(dev));
 	nports = HCS_N_PORTS(ehci->hcs_params);
 
 	for (index = 0; index < nports; ++index) {
-		if (test_bit(index, &ehci->companion_ports)) {
-			n = scnprintf(ptr, count, "%d\n", index + 1);
-			ptr += n;
-			count -= n;
-		}
+		if (test_bit(index, &ehci->companion_ports))
+			len += sysfs_emit_at(buf, len, "%d\n", index + 1);
 	}
-	return ptr - buf;
+	return len;
 }
 
 /*
@@ -70,11 +66,9 @@ static ssize_t uframe_periodic_max_show(struct device *dev,
 					char *buf)
 {
 	struct ehci_hcd		*ehci;
-	int			n;
 
 	ehci = hcd_to_ehci(dev_get_drvdata(dev));
-	n = scnprintf(buf, PAGE_SIZE, "%d\n", ehci->uframe_periodic_max);
-	return n;
+	return sysfs_emit(buf, "%d\n", ehci->uframe_periodic_max);
 }
 
 
-- 
2.43.0

