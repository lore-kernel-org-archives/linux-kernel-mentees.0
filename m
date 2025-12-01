Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EF7288CA3
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  1 Dec 2025 20:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764621472; cv=none; b=Vm+xJZC/pAhPhyLDlm2uy2PveD2oocIyUZbcE4XQrv9LP4woZcsSrPmHO3dERu12AoXaidknHwcZbgDedEi5IArm7WHFnVW85/k3HdB7phw9mt6F1s5fenuGPyILL320um3iFxRdEtAJboe6PSE7dCZvGoERPTwDNb+DKnhcp1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764621472; c=relaxed/simple;
	bh=E+CGsND4ktzv4fl1slpx+4Ix84N/GoJePdgvIslDw/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qrNvyaZmY5k5LQgwb+M0RO7dPUV3hojMV3kX5nhbHeF8d59lExhLyzcGJVG7djbk8Uft5+3SI8/rtbG9Ln+V6c4/JB1e0VikoC4DOjP8FZoZVMfsuLrWNgtLWBLZwmsSYHAkKlDcEWnl5v2WfMLyU58l6+utUTeeLqVaMdryyKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQLFtcxu; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQLFtcxu"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-298039e00c2so66422325ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 01 Dec 2025 12:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764621469; x=1765226269; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Foj/kZet4sWmPv6CgRgKvS0h296uX2HQ0BVM9JjiE9o=;
        b=FQLFtcxuIOzXlP7jg+QZr5CoaQ9sNmuVyZtT5RxgdlNBmu/Fzrtsa836PC0IUIQL/3
         s0HUeLo5CAqaqRGAQi2jPo20YASxqIW13qS9PLf3xZyCNxvlYlDVOCFWJrQW/Ly7Rg2B
         N3UCTGgVRqkfO0/9G7wtGqWD/hjp5vzCsuBqj7yD+zjaY/WuEFwmizY650WBfRnfgLkC
         lLJY8l6k3dFyDecV4NnUGpWvDHgXVJzRDJ2VJMgaIWJ7pcyCwIjL2zezeh0MVejrKxAv
         h9ybbJ28caTqgKk1fBqMdlg1/qvSF6EYGLK94YRZyGDYSXtOhY1zN/bbCRo7F7bEOuGc
         jAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764621469; x=1765226269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Foj/kZet4sWmPv6CgRgKvS0h296uX2HQ0BVM9JjiE9o=;
        b=L5sPYFW+72Li6Ty15ckyscgvAZkN3covfPcCW2UBeSwrUxftO32MhesVR8GTb0g1MS
         ov0BwRYOXu7UFvOSZtCrFZ62iCMobvENnJrkkxDS/rj7Vz2sk4aQGhHTirFr2ZFA0t7P
         gd9TwnGvwYrqGHoLJXbeSosuGsPudrHiCGS+RE0ofmSCvanLJyHsXDr30y6wbUgbeKIh
         zu+Xq/Iu80Y4OUgVQ0HtN41sCRloiKYazsmPts+iiAG6ubgVJ8kRwU4TcHXg8vpYBIqp
         kDxZMCeN8Yb0qLjSmrSQ3iEVLAYqlsSbOKKg/6mfySFVHnJ84Zhozz3pI/Hyl77HHR0h
         ENLw==
X-Forwarded-Encrypted: i=1; AJvYcCWTzcRpG4OO1NpG0KSe7AZKk4DQgaKg60zOKa1PQdaGZFSLVjrImO3psOjFDHNot+OgbBtH3bD8K60/5GzhAjhdoy+GAg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxf3ExDtZ8xIfwqJn5VansSHeiO0eZqsB/3vdh3RjIUBvvvFdD0
	Y7oNgckp4qCynuCY+68LXOPwDNdbU6U11CbgWZi0LIdwy8IH/OmuIloH
X-Gm-Gg: ASbGnctPtQecCXdyKtfz/mfpdfTRkw2w59ChYod1KMBSsymSooUiumaOlm/wSjUN/oN
	V5oExJ3bwBOmDc8Vxzj7FjikSJ9Jnj+eeVtWC3Hzppfdam+5v+z+gJVwshLPqcyCIISO4ATqBlm
	5hnXRapEGO65lw4uOGnf9u6s6guPKwQXRB/ak7tjTd/Pe2WngL8Nq9jta662dWX3xZN2SJOAeNQ
	7CLBgZ+sFPglCP7eANr/mPR7ddBIDg/r0AeZpI3FpSvwq3ZWSq7/JqiacK9UinRF3TOFtMeMDlp
	9MqOhPbMT3w8YS7jY7lykO10glsar8fLFzO0t8obDFOFfwRnoINK2s21zxfmYx9GHR253YiKy10
	rhJjGjMq7xv7NPheHZwt2YCrYpIIVoqT0rMUW8czAchH7TvKjM1G8rQh3XoPEV+3rg+VWMXiRUd
	bLMzCInLylVMRTBF5PtCXpXLzx78G9L/QaQ7Q=
X-Google-Smtp-Source: AGHT+IFpV3Ynx6OFmKG24ZAhlZ70Ahfik48Rrwq/82+ByEDfjerHTI7zqgix48BJMN/pNbi01wDMSw==
X-Received: by 2002:a17:902:ebc7:b0:290:ac36:2ed6 with SMTP id d9443c01a7336-29b6bead349mr470192835ad.14.1764621469225;
        Mon, 01 Dec 2025 12:37:49 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.177.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fb248be1sm13113892a12.3.2025.12.01.12.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 12:37:48 -0800 (PST)
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
Subject: [PATCH v2 6/6] usb: gadget: dummy_hcd: move function braces
Date: Tue,  2 Dec 2025 02:07:15 +0530
Message-ID: <20251201203715.17768-7-clintbgeorge@gmail.com>
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

This patch aims to fix the violations of the kernel coding style by
moving the function braces to the next line.
---
 drivers/usb/gadget/udc/dummy_hcd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 67b453620..031f6ea2c 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1252,7 +1252,8 @@ static int dummy_urb_enqueue(
 	struct usb_hcd			*hcd,
 	struct urb			*urb,
 	gfp_t				mem_flags
-) {
+)
+{
 	struct dummy_hcd *dum_hcd;
 	struct urbp	*urbp;
 	unsigned long	flags;
@@ -2097,7 +2098,8 @@ static int dummy_hub_control(
 	u16		wIndex,
 	char		*buf,
 	u16		wLength
-) {
+)
+{
 	struct dummy_hcd *dum_hcd;
 	int		retval = 0;
 	unsigned long	flags;
-- 
2.43.0

