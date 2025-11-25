Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60497223DE5
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 25 Nov 2025 21:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764104535; cv=none; b=Y2X1V46UYPklvO/YkpyWvrZ0+a+1UROOze7eGaEQAC6tA6YAm6F5FdAb7M6/W9bIOI+iIddmoAdjvoT3CZLD5Vm3uLMM5NKGVToZ2ztQMyd80M6pSOLWf69inokwlzZv/owCuxa9P36mr7GyZRk0PmapXjidk8FhY1PWjmVUUEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764104535; c=relaxed/simple;
	bh=+X2NL/mQII+GwsSzlRCjIi8ay0Fc5THQSfbr7naxGpE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IPHZ02TH4xQsVXDHsYogAV5+3r3s3XFvTfKZKeweY23axX9McCKlv50WaaQz+g75Y7LEX4Vx1fGdI5fNGD/9vanshwhHER8PmcvCCA7gM1c8UbCqcLe1Y4xA4c0RPPAiHhh26pE2RmhrIxszs4Xm93Vk24Br+30T2Ag8ETBmCUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=Tzf/KC/V; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="Tzf/KC/V"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-7aab7623f42so6251296b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 25 Nov 2025 13:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1764104533; x=1764709333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=osXunqhAfL4H6EY3Us+4JhzQ2RBABGSGYhjkFwEvKR0=;
        b=Tzf/KC/Vxhw3OQEGWRq3jGnHF9DZTSZWc5bW+oXwhkYqTkd8bKts5A3xGJF1+wkWP2
         4dZsNwgwOSYtNzxtKKp4gP3DwhBoiBJDN4Jho2fGOGivTc+ZT3GmeVQgnaxfOtoy6cFB
         6HTgKETe/lrDCDsGpllbgfyiHVJu8cEIKE5Yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764104533; x=1764709333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osXunqhAfL4H6EY3Us+4JhzQ2RBABGSGYhjkFwEvKR0=;
        b=PdPNZ+CtNqVsDDEEUcRrgOz/kaPmmNIQbd4cjiVDZVviSLJSROMDF1axXIOVw1GOlu
         DLiwxUIMUHVQtDdboLUUVDIXBQnL0JfnoZmz1x+3O7dthjq/1cazWSZsiIulgtY8TwY9
         tBb2NRAw0BW4+WwBdoqm7I0P+xBBzTom1Jr6ZfGw/wpmRxYIqmhEBA2LZyZMnIIe+Uxh
         qNoqKiI0vaVdaVQ/7ftFNuPSWhv6AfxDl/31qJIb91oDvYYaEPjo442zX4jW5pLS8EOR
         N/ayTWQgLZeszSs0Hg6syLbx9eotnYkRX9ufGWfER/26a1s5oQe7WHRU3/rGcI/wCQvR
         Vsaw==
X-Forwarded-Encrypted: i=1; AJvYcCVWOrYaLDeB+3agzrKnoQc431HrFPFisb0Me4u3rt7NSiSRkIOvw46+6K9JTvCzs7slx0NAofQVsjGyYEu15JMcLvRI4w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCb4bwYNpkZzBwim3IklyHUC/KcE1ggGxc1P6QyLg+NLI9E+Br
	XWXb2T1mcZjpLhEbzl5NvMxmGRxO2rym1rO4ejG1f2QlU1MwlOLIxVlwh9YekDckJFQ=
X-Gm-Gg: ASbGncuLT+lfRBAFT1B9FbaYQIAXCe8iItYBNXlQpvAidsMfa1VQx+1cvu7zcX4uyHs
	QODcENvj6TxXNBzrKLWFFhsIyMIEhQ5HtlUxugT1NtfCPx9QsAYjG1gPgdfybwPWZqKj/h85Xmu
	dG3BQJbJkWd+tstyY9Ab7kKLPHD+qg8OZ0FgP0O8UzBhR3eK29ZLEUQNjIT71eD2Wli2sWYpHbn
	AWPee8LAf7ItiLhrlap1ba+TUZunQ7wQb6zJUDsX/LsM2WGLnJcjuNjbcQ0DoC6q079IRevVvNo
	W3CzxvdSSvJyXIRtTmP7r3kT/fG8tjrHvBG+hPO6LV3bsaq0YpdwIx1lwMvAWPlr730vx2cGmrx
	kqq1N1hzb8QN+1DkuNpImkNpbEZolzSwTUtI29RoNbIwnVjCL7aET+JGMuRWvLcy6/WIAsPk1dM
	yElSRk/ua6CDH73cC7UGlRk03F6KD/s2nYe6g0003m+48/HywCgKCYEDCB
X-Google-Smtp-Source: AGHT+IF8rHdGCk+hPhh11+D10Hl7dwICt6inpTxsalZAZAlVFcjaUhKIhxOQY9T2iFRuI0A5OjEuPQ==
X-Received: by 2002:a05:6a20:a12a:b0:342:e2ef:332d with SMTP id adf61e73a8af0-3614edf0345mr18775051637.40.1764104532467;
        Tue, 25 Nov 2025 13:02:12 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2405:201:31:d869:2a74:b29f:f7bf:865c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75e4c9ff5sm16915596a12.9.2025.11.25.13.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 13:02:11 -0800 (PST)
From: ssrane_b23@ee.vjti.ac.in
X-Google-Original-From: ssranevjti@gmail.com
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Felix Maurer <fmaurer@redhat.com>,
	Jaakko Karrenpalo <jkarrenpalo@gmail.com>,
	Arvid Brodin <arvid.brodin@alten.se>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
	syzbot+2fa344348a579b779e05@syzkaller.appspotmail.com
Subject: [PATCH] hsr: fix NULL pointer dereference in skb_clone with hw tag insertion
Date: Wed, 26 Nov 2025 02:31:58 +0530
Message-Id: <20251125210158.224431-1-ssranevjti@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

When hardware HSR tag insertion is enabled (NETIF_F_HW_HSR_TAG_INS) and
frame->skb_std is NULL, both hsr_create_tagged_frame() and
prp_create_tagged_frame() will call skb_clone() with a NULL skb pointer,
causing a kernel crash.

Fix this by adding NULL checks for frame->skb_std before calling
skb_clone() in the functions.

Reported-by: syzbot+2fa344348a579b779e05@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2fa344348a579b779e05
Fixes: f266a683a480 ("net/hsr: Better frame dispatch")
Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
---
 net/hsr/hsr_forward.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
index 339f0d220212..4c1a311b900f 100644
--- a/net/hsr/hsr_forward.c
+++ b/net/hsr/hsr_forward.c
@@ -211,6 +211,9 @@ struct sk_buff *prp_get_untagged_frame(struct hsr_frame_info *frame,
 				  __FILE__, __LINE__, port->dev->name);
 			return NULL;
 		}
+
+		if (!frame->skb_std)
+			return NULL;
 	}
 
 	return skb_clone(frame->skb_std, GFP_ATOMIC);
@@ -341,6 +344,8 @@ struct sk_buff *hsr_create_tagged_frame(struct hsr_frame_info *frame,
 		hsr_set_path_id(frame, hsr_ethhdr, port);
 		return skb_clone(frame->skb_hsr, GFP_ATOMIC);
 	} else if (port->dev->features & NETIF_F_HW_HSR_TAG_INS) {
+		if (!frame->skb_std)
+			return NULL;
 		return skb_clone(frame->skb_std, GFP_ATOMIC);
 	}
 
@@ -385,6 +390,8 @@ struct sk_buff *prp_create_tagged_frame(struct hsr_frame_info *frame,
 		}
 		return skb_clone(frame->skb_prp, GFP_ATOMIC);
 	} else if (port->dev->features & NETIF_F_HW_HSR_TAG_INS) {
+		if (!frame->skb_std)
+			return NULL;
 		return skb_clone(frame->skb_std, GFP_ATOMIC);
 	}
 
-- 
2.34.1

