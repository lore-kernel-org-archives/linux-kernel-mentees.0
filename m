Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4F72FB607
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 22 Oct 2025 22:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761172729; cv=none; b=D8D2g350lE3xp6Ge0CtzHivX03VSNLxNnn6hHfmAu1CtmYBMVVF637ne6oWtNI2MoXCk3rytqGsb5jAqVg4s8PSzQwxoG6y0XGcxdpIiTEkg/IIpBTp/cM6uaOE7V7YD9Qfq47zU0GhssMFlWq6K2B8IXIU6KuHoLAHbT4oTsVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761172729; c=relaxed/simple;
	bh=ULKv6OA6DP41wT5L4cbEcKCtaPLTWzh9900cBvwjo/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WNNZlBGQGasL9tI/BKMjqvJagvwBYCA0Q7vgMmo4CNK5A1r8TAWbEdJmPSESZmexXJGtgxg6vupveft+tUvHFPmZeoGu/Qhw3OwqSVrOQUo4LU8Od4IbkKhqg0aBjCGPvxF4//QLuhVoC4SLKT6gu2BIJsepJaCmsNSeD5zY2No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OofCaqoa; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OofCaqoa"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8907af237ceso12689085a.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 22 Oct 2025 15:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761172726; x=1761777526; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5VocPRDtVk+dIE3iw2ib7QtB3Kc3D8UgJbJMrfJb3wI=;
        b=OofCaqoaSzX4gV61W3SkA0FzhtqdYSFRqwRaeOjtPWeP1NsS6LA5LiPPvxNWkAdvCE
         4/g3PCdCETw4J+K/bsC/CKVfnJt7hTup+N2TLyqUU6b5U+1m8Y762O/cEgi1Of2409Mn
         b9UWQ1khBeSxq3mEA7p1yTEKUqAmfnuAs3mX/lPBlxd99wSCp2odtkLz8E1/Bt5gxxw2
         1aGY7QPF1jNwEMlKZzp4VWfncpqwuQFxAGeh2XGu9N5n18X0VkrAZKxPjEsfaAo05PxI
         T+1JUZuLO8TcEgOfiLCoWO9iSrdiuFXGXjbWODUMhHYanWF/nV3tX7rL975icguF35kn
         qUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761172726; x=1761777526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VocPRDtVk+dIE3iw2ib7QtB3Kc3D8UgJbJMrfJb3wI=;
        b=pKAtpE97DPN+AFGgP6cOAwghCsrjMs6DgAd5nWudqAJfHkr6F/F7aoyPabB8siri4K
         OWLtGQawKqkotQtutg9Vt/6UoloqW/N9nQxFwxTJgf+JpUhxlCfJvoQ5+sj4SpW6OIki
         G6zg3cpJLefaMMnOJnMUbzDubXtB67Ut5XzlW6qY8fbYdF+smWfb6qDoJa0SAvhRPcws
         fKWzfMtH8hGkZynLsWJWhvgfbTFeFXLwYNEIyKyy+oQPM97oKjQLcsoS0LWh5/zXmLvl
         kfCa7jvFrcmovtzkQj2aF9uQ9AIN652P1PDm5pDwbDYxXIYTyC13OEQjF54w2JHYkVpt
         xZ3w==
X-Forwarded-Encrypted: i=1; AJvYcCUkUQc/zOttZ3HIP/91tjHDbN5sKo0ug8uajQfHNXIhZyx+aDuN3evT8ox77z7z1c/UmLZjRmOH05r6xPws71AtOeaOKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPSRIEP8s8nfCf6tRxmOtMoIYilq9uPNdHXGczmUoCVUuoo/Dd
	MevpVtBIsufJy1Y29YTPrQkBgBILk9Y2mdFI+5TpUfaUzgM2z0hx0A3p
X-Gm-Gg: ASbGncsKrDoEN/LDHzd9ytgXjNi4dpk148OwqJRB3teFREZg6AJ0SXRAH8Flv/0lPIA
	MYtRqOJweSUMz3IbbIRpBj5C7UIyg8vmz7AbSxv8B7FNUM+CSNDsyx3jACRbfDeO4DVQmjVtmjE
	a5w1xizUtxDmOJzx3MmUqqEos4v83rQpRQPgkG0dcpPss4+x8atkpyRUt3gc4vdl98oHLC3az3Y
	CFpfvvAkzkETsSOUsu7CC0jW0XSwQVCZWjsC6SDRWVoZZoqYHKYQxvSJb1L2RQdjqw1YS2ddLG0
	kpLDEQQ9lIUMGz3J4IE+nyFBYALKIdYRg9WB2IHIzFgWXLeb0N/OEghIg0bRE40a/9OrEJKCEtM
	GS6JJ74GoEwvAGCGOzgqitzUfAvKfdfvd+VL5oZqlpoJrvJ8npaN2Tz0fC+P18vb9XYtDzMfAhi
	9KBpo148XdUZoYS3BtC0w7
X-Google-Smtp-Source: AGHT+IEwf7KTlPfmIBbi2nVEJKfKO6Y8rFXq7vPh5m0MioYFQ+fvpto6UGE7cIpu3l0BBWVrrjj6eQ==
X-Received: by 2002:a05:620a:1724:b0:893:5433:741b with SMTP id af79cd13be357-89c105a9550mr92282885a.40.1761172726364;
        Wed, 22 Oct 2025 15:38:46 -0700 (PDT)
Received: from rpthibeault-XPS-13-9305.. ([23.233.177.113])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89c0e586d32sm30609585a.18.2025.10.22.15.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 15:38:46 -0700 (PDT)
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
Subject: [PATCH] Bluetooth: hci_event: validate HCI event packet Parameter Total Length
Date: Wed, 22 Oct 2025 18:34:16 -0400
Message-ID: <20251022223417.139332-2-rpthibeault@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is a BUG: KMSAN: uninit-value in hci_cmd_complete_evt() due to a
malformed HCI event packet received from userspace.

The existing code in hci_event_packet() checks that the buffer is large
enough to contain the event header, and checks that the hdr's Event Code
is valid, but does not check the hdr's Parameter Total Length. So,
syzbot’s event packet passes through and uses the un-init values in
hci_event_func() => hci_cmd_complete_evt().

Reported-by: syzbot+a9a4bedfca6aa9d7fa24@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a9a4bedfca6aa9d7fa24
Tested-by: syzbot+a9a4bedfca6aa9d7fa24@syzkaller.appspotmail.com
Fixes: a9de9248064bf ("[Bluetooth] Switch from OGF+OCF to using only opcodes")
Signed-off-by: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
---
 net/bluetooth/hci_event.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index d790b0d4eb9a..5e1498cc04cd 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -7565,7 +7565,7 @@ void hci_event_packet(struct hci_dev *hdev, struct sk_buff *skb)
 	hci_req_complete_t req_complete = NULL;
 	hci_req_complete_skb_t req_complete_skb = NULL;
 	struct sk_buff *orig_skb = NULL;
-	u8 status = 0, event, req_evt = 0;
+	u8 status = 0, event, req_evt = 0, len;
 	u16 opcode = HCI_OP_NOP;
 
 	if (skb->len < sizeof(*hdr)) {
@@ -7585,6 +7585,13 @@ void hci_event_packet(struct hci_dev *hdev, struct sk_buff *skb)
 		goto done;
 	}
 
+	len = hdr->plen;
+	if (len != skb->len - HCI_EVENT_HDR_SIZE) {
+		bt_dev_warn(hdev, "Unexpected HCI Parameter Length 0x%2.2x",
+			    len);
+		goto done;
+	}
+
 	/* Only match event if command OGF is not for LE */
 	if (hdev->req_skb &&
 	    hci_opcode_ogf(hci_skb_opcode(hdev->req_skb)) != 0x08 &&
-- 
2.43.0

