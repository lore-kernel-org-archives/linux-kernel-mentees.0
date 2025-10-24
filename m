Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD1C26ED2D
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Oct 2025 16:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761323776; cv=none; b=ZvEQHpv/wQlxSoMLZ4yKFZzTCMQKSmQ6z81XuVKLOJmEvcdtsi5lXG6jxigvwYUvPM1ko9xNnWYLVQTivJ10/g7M8TN2H5rvb/SF2EjkO0T5i5DuTrclqwO9+HPOznxFpdmkbxtAMMADQMnjLXrCg7bNLLsKMqSqRegvLNCT0J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761323776; c=relaxed/simple;
	bh=Qzgh4TwmdqAlsGKEFX9L3ufviEEfHBTNxvxl57muGoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k4zHxK/UffWd5ugS3MNkyRSYURbOJf8yZ2FBm2lmWNiykby5htuK543ECTmSih+25Om5t8sT2frSTpabuSqdS6ftHC/5yAlrI9n+ZYnMnlNRVkwERGZl4w9GrSuZ5ydMYkZhpkK4kfwrKDP/IBHfvO1cEfHxKHBVktAoZi845sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HC0S4G2t; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HC0S4G2t"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-87c1ceac7d7so22568016d6.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Oct 2025 09:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761323773; x=1761928573; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBtuboWe2Q4Plv4p7qqEyz/yAU9YybNXJhSJ5Y5XAWw=;
        b=HC0S4G2ttCfwyYyyTpWqEuroH0G2fBNoqwrThTU4rDoc+qbHihJu7fTfrSWUBGmhun
         Wen4v/1Gm4CPGfroW7FKrftg9KMHgF4dYdaJFcDUCOJfii7sG5QRv7rNUFNl1xLrF32o
         3FZVqoCANPC3CoXmE5c0vPmqhJ3F7vQ+t7/+8bBweWBgegfZAqkNelK1ZQuW9xoxzVEy
         tkSVWvnE1u6Ap0OPkIALL8hT00ArMagvUBfWUAusNjlzVAI+4N5zaSEFGRtvFaoAsi6d
         Y6BmlfZOZEA8W7Unv98Dp8Cnq8O0u6IrwjhmgFEXXfuSHpi9C8nCvbBvumaWLXuJrILB
         /Dfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761323773; x=1761928573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QBtuboWe2Q4Plv4p7qqEyz/yAU9YybNXJhSJ5Y5XAWw=;
        b=ozt6NBtCniu6sr2ccR2Res7OabvO0OiIDorY7TWzMjnS1udSlDBK3L6y6FYiBs5/68
         9nHZ72nk2IChH3C3OK6b8ugoBpYTxhWYXpZqSctT6XirhFnbTVd7DRI685rS/K0ZWg9E
         TAEYCqYk3AM0HHg/8TVjP+LIFX3brsjXXlcgPL6K7DUuGp7vyvRKaLZoHSUagyqYnKyP
         RQ3R0FF6Q9sC5JK+siGH02x0lEny43nelkoEIyR+hab2OnlW1Me3z4TjAB0SADzhvjRg
         QWfXeM6QZHpOm/CjVTLXCW5XyIyw6ozIc6MlYsf66X5yMinwC0nB31Eb3fwpqxIVUfzk
         W1JQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3Xgbv5n8ppItC5MEc+yW1c9CDr0k/mV0PZL+nGFKCcdGfpvY7dOZ8Ju/bMZV52B6HddbWLVT1qkJHfSJIjH+C5k32wQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu7I8cnxWh2hKFRhkY9tRHWqqJ2ZsVlRF+XogUA9TdOqQfZ8Mb
	UMmGqDHhZ6PWOwCB6JRvhGytELX7GelziHypyYLwYKVzgSXnib608siG
X-Gm-Gg: ASbGncuFTBP+3niavJLKbMlCWNqsf1PrhZcc5OBm3Kr+E0dtEwyOsNMtCo5VV2pFCt2
	2u/dXP1Nwsmk+jotUyOpE3IhlUH+Afylz6bAwVV4xqFlc8mh0yukg3BRELU2eUZRybRQTXsKErj
	xNbcdcMpaVe1t9ILafi4mfcf9sN7Dlk6UKM7CAIg8EQc3nHQC3t1UZct9lQWUt9pCKDJxcgqfae
	CNBUhz7FeZ9Sx+VYF4Amvz/Z0siuMG4JxEuIE91O5Oss8X18uvpbTGI6otZEE7x6cPLgoh7oD8r
	wuary0JTFdTz4n7Dpxy0fSv15hUUi9wLa4vszAv8I/41/6rlIuqWzzrz6/O4DcubYjsmIns6wbA
	DtiDtcB1YLdawBX3a9NaWfbaRk79X80D0O/EXB0w4wDYOatUOv6H1s8xK5gjV6+gfp+rIs5fONd
	H3RoWmm+zbPEdJ4wdnwWX1z8esh30qYMM=
X-Google-Smtp-Source: AGHT+IGKHP8NoxcYy/C47NubjPRMEfZKuZ2ykE1dPkqqxoalIE1zRnG5oQpATNvC6wV2Okf3syX3pA==
X-Received: by 2002:ad4:5cea:0:b0:798:513e:3bd with SMTP id 6a1803df08f44-87c20545decmr340344866d6.3.1761323773013;
        Fri, 24 Oct 2025 09:36:13 -0700 (PDT)
Received: from rpthibeault-XPS-13-9305.. ([23.233.177.113])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87f8fb6d2e4sm40908776d6.13.2025.10.24.09.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 09:36:12 -0700 (PDT)
From: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+a9a4bedfca6aa9d7fa24@syzkaller.appspotmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: [PATCH v2] Bluetooth: hci_event: validate skb length for unknown CC opcode
Date: Fri, 24 Oct 2025 12:29:10 -0400
Message-ID: <20251024162912.221224-2-rpthibeault@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CABBYNZJtp0wqL_SJEk0wVo4DuadrBirmJ5VOe_TyE_RN8jOJNA@mail.gmail.com>
References: <CABBYNZJtp0wqL_SJEk0wVo4DuadrBirmJ5VOe_TyE_RN8jOJNA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In hci_cmd_complete_evt(), if the command complete event has an unknown
opcode, we assume the first byte of the remaining skb->data contains the
return status. However, parameter data has previously been pulled in
hci_event_func(), which may leave the skb empty. If so, using skb->data[0]
for the return status uses un-init memory.

The fix is to check skb->len before using skb->data.

Reported-by: syzbot+a9a4bedfca6aa9d7fa24@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a9a4bedfca6aa9d7fa24
Tested-by: syzbot+a9a4bedfca6aa9d7fa24@syzkaller.appspotmail.com
Fixes: afcb3369f46ed ("Bluetooth: hci_event: Fix vendor (unknown) opcode status handling")
Signed-off-by: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
---
changes in v2:
- check skb->len before accessing skb->data in hci_cmd_complete_evt(). 
- remove v1’s changes
- update commit message and Fixes tag 

Thank you for the response Luiz. I didn’t want to spam you or the ML
with another reply since you were very clear.

 net/bluetooth/hci_event.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index d790b0d4eb9a..d2ac95a824db 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -4211,6 +4211,13 @@ static void hci_cmd_complete_evt(struct hci_dev *hdev, void *data,
 	}
 
 	if (i == ARRAY_SIZE(hci_cc_table)) {
+		if (!skb->len) {
+			bt_dev_err(hdev, "Unexpected cc 0x%4.4x with no status",
+				   *opcode);
+			*status = HCI_ERROR_UNSPECIFIED;
+			return;
+		}
+
 		/* Unknown opcode, assume byte 0 contains the status, so
 		 * that e.g. __hci_cmd_sync() properly returns errors
 		 * for vendor specific commands send by HCI drivers.
-- 
2.43.0

