Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC9F274FEF
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 14 Sep 2025 06:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757833000; cv=none; b=gfIebPow9bE+gCwTSiRD/xPMrQjm+Nzkb8ElPEYMGyB59vaO2x53CS5zYVqeTwp+pl9sv31Oj9Vg6PNdclkcS0p871eIfigJRXHYqzOGgHuYiJ+LYSfq+aiF0k2cObfFeVxXElsO5U+8tF4ZESBKizAOgn/vmtZaU9YcE7Jj7k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757833000; c=relaxed/simple;
	bh=Q812AXx6dejqCWgirZNijQXyD/Rb4pPDTgkvtVVfJtc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mTlIfV7/QsXJnDwW9HJNy2qgby3bdlQqXqtAJi8ODMP8MvTG8r8ocqp/D1WhtKN+f7l/O2mkdIvFbDIaL8Qbat7GXYx4t5OmdCsEwL47DJoyiNqMI5vZ6/BfrFxJ4cvMneX78G3NJNrOw3HNJt1NtzPVrdg0OpBKOXkprNQI244=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jResXjwk; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jResXjwk"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-776df11e5d3so646778b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 13 Sep 2025 23:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757832998; x=1758437798; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j3j+6RFJp8fBl5UFi4n25Nhq071AJDVG4+e0E5+b4Qw=;
        b=jResXjwkYr5M1Sb2Q1JpiznJQGWq/dVQ/jVadis5pfeRCFe6OWYBTU5TZF5ivSzdxT
         VtKdjMLWfcfCjdAvF17dlfg33Vx/fsrNNgyvMTVkaAygnAvR5gYjePxa08AZZ8t4xRVa
         w0fPOdkJJNeDSDOuKYtATHc+MluIC5oGXEw9BJ10IdUkSl8W+/2jSOWJzoeuwT8JThEW
         FwSbS8lwkMy122mjTt1JD749P0nPq6/wCnP7vgCNB55lOAsj1ksJKwbprtmVjwsocyve
         mpMZ+RjtPdUZPrSQig1IgGlb68Ny1NolGbY9QX17bGVtFua4f4zI0YCa8a1YwNTnhx9i
         xYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757832998; x=1758437798;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3j+6RFJp8fBl5UFi4n25Nhq071AJDVG4+e0E5+b4Qw=;
        b=UDGz0FqBHgw6YyxEsV8aamNTnrikLOw4oQhBfIECTOEUILvj0KY7xxShBKbGFJoy02
         aMEDDZycT20z+fx+8XquCTg2Z/zIH9myAQwuScP/1cqynadiQZanbUyYp4wUPlB18CHi
         0w2s25G1jG0/dXcw07L4S28UBGAkO4gwst33wy7P0VZEnJnXbGsvAY5KF0jzmbspicNL
         PBjVrwWWFS/jvENH0sLoFwXHp9MFCqhj79w9yMcIuY+yFQ7spI9LPOpN97omiLosJ3Tg
         YuhK2ILdU8xDUbIP4cI7qKE2FNS6t+XIExmVeGBgidmJCHzc76hMNx3EAeRht41JQhz+
         fL3w==
X-Forwarded-Encrypted: i=1; AJvYcCVnztXbo70oRAWrTrYLlx7PdvhJNfIq4rqX6nLmUPC6HzzPwvkim/3jJI44IF6Jgh6W6TvDNbljMVM/IBy2Kv0vLf/vyw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywijkch9qii+y72GfdJzloKT0Vbc/W09XzZ/VekZ6TLbN+DgZdL
	3l5A4ejCVmWRPtaB/v82gdiL22uZs/vMVApadUhp7vQ9olET4ToY3rTf
X-Gm-Gg: ASbGncvk6Qf9JFhiqxR7LAnPj4V1DMR3K0LGesjFvcKQKKccFUOAjlpNXP0vE9zq6P1
	EBCakbRjA+rQ5p7QzxeDcDYfW3h5hH3QLbiGbM7Ywo+tP+aFLB+a7Ufhnm0uC5meq46Wo7e261D
	6CTcUxwow88ywXdivoSX6e+3oDi8rIKnuOZf/bduNiqHC9jeDuOs7OpxSDOy/T6upbHGSQ28wyN
	S+gYd3J+7Ckmi5EKGP7QsJJABR0DqVss07MVYVYqO7n9SrHwVAVU1ftJSkjUQxBEvSO6pnC3UHl
	6WVIj8LynAv6IVdGoW17Ni2AqkRASS2QOG3VYlQCVr9Sn8KQncO1zHBj9dmmCPqxBgAaNfX0S82
	Bgzfu3ANo2dCWKXbT1HvHJrM2oxCpaSk=
X-Google-Smtp-Source: AGHT+IGznuor/LGxwCbRZQ1XmIF0s2BXLDSzFLDiBks6mLGDvb81hNwtxuW7F5JOgR4jeZyqmWNTwQ==
X-Received: by 2002:a05:6a00:3d51:b0:772:5513:ba3b with SMTP id d2e1a72fcca58-77612077d87mr9562392b3a.5.1757832998188;
        Sat, 13 Sep 2025 23:56:38 -0700 (PDT)
Received: from localhost ([159.117.70.219])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-77607b18ec7sm10171435b3a.54.2025.09.13.23.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 23:56:37 -0700 (PDT)
From: Nai-Chen Cheng <bleach1827@gmail.com>
Date: Sun, 14 Sep 2025 14:56:18 +0800
Subject: [PATCH] Bluetooth: hci_bcm: use str_low_high() helper instead of
 ternary operator
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250914-bluetooth-hci_bcm-string-choice-helper-v1-1-05e05bf0e21f@gmail.com>
X-B4-Tracking: v=1; b=H4sIABFnxmgC/x3N0QrCMAxA0V8ZeTbQFgfOXxGRNsYlMNuRdiKM/
 bvFx/Ny7w6VTbnCddjB+KNVS+7wpwFIYp4Z9dkNwYXRTf6Madm4ldIEhfSR6I21meYZSYoSo/C
 ysmGM7EaayF9SgB5bjV/6/Y9u9+P4AeoxQfJ4AAAA
X-Change-ID: 20250914-bluetooth-hci_bcm-string-choice-helper-aae05c9c18b2
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev, Nai-Chen Cheng <bleach1827@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757832995; l=1308;
 i=bleach1827@gmail.com; s=20250730; h=from:subject:message-id;
 bh=Q812AXx6dejqCWgirZNijQXyD/Rb4pPDTgkvtVVfJtc=;
 b=KFujJ9fybEPgVWX3e1HODwtSS+x2VXNY21xe436FpBVJyjq65+B8JpNBYc09NOVfTF6ClgkUd
 qkNZqgIwnraBHy710hekebvsj59+EQdtU/Ti6iez22l7o+TI9SHmg96
X-Developer-Key: i=bleach1827@gmail.com; a=ed25519;
 pk=jahFPRplw20Aaim8fIt8SxlFMqkHbJ+s8zYBGbtHH5g=

Replace the ternary operator: 'dev->irq_active_low ? "low" : "high"'
with the str_low_high() helper function. This enhances code readability
and maintains consistency.

Signed-off-by: Nai-Chen Cheng <bleach1827@gmail.com>
---
 drivers/bluetooth/hci_bcm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index f96617b85d8777972137ca146ab99a3d8da12584..65740b86c49c42b65a67cbd892daec2358a09394 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -26,6 +26,7 @@
 #include <linux/dmi.h>
 #include <linux/pm_runtime.h>
 #include <linux/serdev.h>
+#include <linux/string_choices.h>
 
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>
@@ -1213,7 +1214,7 @@ static int bcm_acpi_probe(struct bcm_device *dev)
 	if (irq_polarity != -1) {
 		dev->irq_active_low = irq_polarity;
 		dev_warn(dev->dev, "Overwriting IRQ polarity to active %s by module-param\n",
-			 dev->irq_active_low ? "low" : "high");
+			 str_low_high(dev->irq_active_low));
 	}
 
 	return 0;

---
base-commit: f83a4f2a4d8c485922fba3018a64fc8f4cfd315f
change-id: 20250914-bluetooth-hci_bcm-string-choice-helper-aae05c9c18b2

Best regards,
-- 
Nai-Chen Cheng <bleach1827@gmail.com>

