Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92ED14A60C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Nov 2024 21:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732051498; cv=none; b=Xlb6HE+hKxkNoOvKOuBWGtahTezBjIOLvVfP8IdgoCnHiDENy6Yp1RFy4BvE+MKTBY5fglfoHoQB4ST45Gg0shs1QOad/duw0Mc+afB/xwoeaWPrsn2ZXm7nalrarVF1t9ovRmDQ2p1jEq1m+zHJHPHyCjgt3wHsTnxIn71Jqd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732051498; c=relaxed/simple;
	bh=dXGgkWe+4BMLaI3Lm2v0N49ZjSE/JrvGn7fMjcWirKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GawVb7f6FoEQHG4CILUAqnGTTzq6bWn3/wfwkd/0GUDStCus55c6SYDFNKWzDqcFU0j9lhpkJqrPtK4+BvDHmEGs1KhcfDt927K91Mn6IRR4UqQOkUXuZYkVyJaZY254D3Brk8gb2pMYFYXd2jPYmIPV5wl3rGaniyaZmsP3DwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QfdT62uh; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfdT62uh"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71CE860AA7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Nov 2024 21:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHpwDYQmATBw for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Nov 2024 21:24:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7FE4960AAF
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FE4960AAF
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QfdT62uh
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7FE4960AAF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Nov 2024 21:24:56 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-6ea5b97e31cso2071547b3.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Nov 2024 13:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732051495; x=1732656295; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XrBnHWzui5ajJG2pMcHOyK8xqGhF66gzfKEXVnIlLcU=;
        b=QfdT62uhjZM+e0QeMB1LbC4rwHzgl3274HVE4aAgZdYzNnOKWHdpeDjt8CrUuztrYY
         k/cnEOfOPXuzcevs3kPUb1HOTKqW/XiYJ1xxsON80kl9uahGOwYg/MvGc6KHCMnGkZdi
         jGj5RPnqs8hTzEf/05vxsTnaU9dSoFv92wl7KBAsK8BiRWRmpcXR6XVKe1kShsvZpi/v
         JNRZJLPX0jEsgJstXvDbUO3S/c8QqVg9Qf0JqvkyheWyo/E6tP1Z+vR6pw/voZMlJBq1
         pBnbG5NSCpQqZS/oSGKq0SjgIJMu+PoL4a6sPAUU+ViGmRYsQhM69WPgyg34WDmgzn0U
         bWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732051495; x=1732656295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrBnHWzui5ajJG2pMcHOyK8xqGhF66gzfKEXVnIlLcU=;
        b=GXtDCCQnT3d9vv1ja3JfMlh9yxkm3ydGbjLg1JMyf6AI0DEszSY31Vx9jZ9ksMomUb
         oqx1cUz5FORSef0kdovh9zbXdUAmcZRn9v5kXUPeHpcOeD8W/OPiD4tSC++ZpQBUhKHv
         qr/nYPx+Ya9GskyLp+ZsoTWOm0PRn4IqoxS1oyD4WVyMLa5GvXpYmBB2T2oSm0c94U//
         Hv8IRbJFWj4P262rohaPfnHMu7bYH7pxGnR1rw0/99kN5npCbYLUUpr2jvsl8+PeVWwx
         QM+XxQR9q34viqNT1Ad2ChRbQmRBNZrwypPK3TSYrlljj45Oi0zFSeIexUwU8aSF9s50
         +peQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGz96ChuswXQFX8KKObaIUXG7T79po5K6V66JIJ3epSeaaVol9A7i2MsDKznAjffa36bBRhIKBefWx6Dq207urGWH5ag==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzRiQ/oUelI+Oy2w9IN0UinHx9FPSRShGElMNxZTe40pSIGWzFo
	9PZ4PctdlWa2ONruxvZ7EY0JT5ubMOK/Z4RDUIQzB9htJRIEMmw9
X-Google-Smtp-Source: AGHT+IGeJRlXNincJupegpSkUYSTkphGlAH1mccKLE44MBrYRH4PL/iHiTJSxCDFVAyvQoNf41gBng==
X-Received: by 2002:a05:690c:23c3:b0:6e2:1c94:41f8 with SMTP id 00721157ae682-6eebc318939mr5931167b3.10.1732051494968;
        Tue, 19 Nov 2024 13:24:54 -0800 (PST)
Received: from x13.. ([157.23.249.72])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ee7137ede8sm19092257b3.122.2024.11.19.13.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 13:24:54 -0800 (PST)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	rbm@suse.com
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	skhan@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] usb: dwc3: remove unused sg struct member
Date: Tue, 19 Nov 2024 16:24:51 -0500
Message-ID: <20241119212452.269255-1-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sg member of the dwc3_request struct is no longer used and should be
removed. This patch drops the unused member, cleaning up the struct.

Previously, this patch addressed a documentation warning caused by the
missing description for the sg member. However, upon review,
it was determined that the member itself is deprecated and can be removed
entirely.

This change improves code clarity and avoids maintaining unnecessary members
in the structure.

Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Reported-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Reviewed-by: Ricardo Marliere <rbm@suse.com>
---
v2: remove unused sg struct member as per review[1]
v3: 
  - Add reported-by tag as per review [2]
  - Carry over reviewed-by tag from v2 [3]
  - Update commit subject to reflect maintainers
  - Update commit message to reflect actual change gathered from 
    Thinh Nguyen's feedback

[1] https://lore.kernel.org/all/20241119020807.cn7ugxnhbkqwrr2b@synopsys.com/
[2] https://lore.kernel.org/all/2024111922-pantyhose-panorama-6f16@gregkh/
[3] https://lore.kernel.org/all/5l65sdskdzbehxamff5ax4ptiqhaxh7ewi4umtpp6ynen45nj6@nebuxjg4c4rx/
---
 drivers/usb/dwc3/core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index ee73789326bc..3be069c4520e 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -956,7 +956,6 @@ struct dwc3_request {
 	struct usb_request	request;
 	struct list_head	list;
 	struct dwc3_ep		*dep;
-	struct scatterlist	*sg;
 	struct scatterlist	*start_sg;
 
 	unsigned int		num_pending_sgs;
-- 
2.47.0

