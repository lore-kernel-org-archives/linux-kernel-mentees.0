Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A47C6FD1C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Mar 2023 17:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 044B040635;
	Thu, 23 Mar 2023 17:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 044B040635
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JJQB8Vr7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ekpDA8UlUs5N; Thu, 23 Mar 2023 17:29:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B2D2B41D95;
	Thu, 23 Mar 2023 17:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2D2B41D95
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1DF24C0071;
	Thu, 23 Mar 2023 17:29:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F072C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Mar 2023 17:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2744361555
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Mar 2023 17:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2744361555
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JJQB8Vr7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 71R87pDjrN0s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Mar 2023 17:29:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B5296159D
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B5296159D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Mar 2023 17:29:06 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id q102so7623864pjq.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Mar 2023 10:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679592546;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zMZZ6Tcdapuhof/i/nzGFRj0fuePe+lfLjf6gEGMDaA=;
 b=JJQB8Vr7MplIrOqQUE8j55kUWU8R1tdzDxkeHZs3Z7Nt8qpYMbNhVkS8ZIlr7Uw7Xw
 YwPNZFfFX4igQz695AHv9CN6P3BZHPaJp3F0FAGBeEo/0TNWPHXta+l7PQTNTu3gmuoD
 qNfnrAc2JdgzK2eOYF5ncFkLnUQc+hFpc5ehSEYBqqZgX2/tXtuc+sRUJBeUnS9EIl3T
 F+kNvm169HmX4YwjNGFORfoXD7bseQzue33WIjaqPHRIX7h4RlMf5gEqyrwNe8vOabaO
 2H9kV7PGuUFH9m7PX5eHbOrslRKoUVAoqUM74pygwOGaVfEWvv+pvqgSXauPrqCvMcjj
 6DwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679592546;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zMZZ6Tcdapuhof/i/nzGFRj0fuePe+lfLjf6gEGMDaA=;
 b=og0LrN6mbq/T3K5OJzQwWlzz23Lma7AJbUE+ZwvwdCHLfjV1wAx+xDqHJX88T/hcL5
 M4VgvHFyOCTdt71DQisYbdZpYqVQbIXKCUbQbkzlfbSmKyMCLGyfexFtyGMGRSiSCg6E
 cfhmxisvARJ9ERhPHzrIz2oxawBjQsHSxOVRTw7mE4QYF0A8ctC4CDm/GcQ7mkEihh8/
 EMvBiBnRk77hTfLhm1RX2v4TBtVueRCkm91YfQVFyENw7t6B2Y9g+5cAW4u1dXJIsX4q
 kaDqtyLQJ1jypPRpjK0ULTdZKCs54AuN5D5lJCq/SJqqp29EVfW6ovO6Yp2bMZSypzqi
 4zVg==
X-Gm-Message-State: AO0yUKW5zdcPrit9ZUeTsPV1R2l3EN0OybK3tCPW/FILkvs3uGajX+a3
 UG1K8/sSPLTQSdk9iY/3DvM=
X-Google-Smtp-Source: AK7set+u9tUFLPhTIUjtBT8TxguYuKCL7Y8+0lU2tr8K8Iyjx83VlHZ5GwHr+11lqr4smZ3/h/bDpA==
X-Received: by 2002:a05:6a20:49a9:b0:da:5ab7:8cf3 with SMTP id
 fs41-20020a056a2049a900b000da5ab78cf3mr3492515pzb.30.1679592545666; 
 Thu, 23 Mar 2023 10:29:05 -0700 (PDT)
Received: from pop-os.lan ([14.232.107.112]) by smtp.gmail.com with ESMTPSA id
 s10-20020a62e70a000000b00593e4e6516csm10706427pfh.124.2023.03.23.10.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 10:29:05 -0700 (PDT)
From: Anh Tuan Phan <tuananhlfc@gmail.com>
To: brauner@kernel.org,
	sforshee@kernel.org,
	shuah@kernel.org
Subject: [PATCH v1] selftests mount: Fix mount_setattr_test builds failed
Date: Fri, 24 Mar 2023 00:28:59 +0700
Message-Id: <20230323172859.89085-1-tuananhlfc@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Anh Tuan Phan <tuananhlfc@gmail.com>
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

V2hlbiBjb21waWxpbmcgc2VsZnRlc3RzIHdpdGggdGFyZ2V0IG1vdW50X3NldGF0dHIgSSBlbmNv
dW50ZXJlZCBzb21lIGVycm9ycyB3aXRoIHRoZSBiZWxvdyBtZXNzYWdlczoKbW91bnRfc2V0YXR0
cl90ZXN0LmM6IEluIGZ1bmN0aW9uIOKAmG1vdW50X3NldGF0dHJfdGhyZWFk4oCZOgptb3VudF9z
ZXRhdHRyX3Rlc3QuYzozNDM6MTY6IGVycm9yOiB2YXJpYWJsZSDigJhhdHRy4oCZIGhhcyBpbml0
aWFsaXplciBidXQgaW5jb21wbGV0ZSB0eXBlCiAgMzQzIHwgICAgICAgICBzdHJ1Y3QgbW91bnRf
YXR0ciBhdHRyID0gewogICAgICB8ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn4KClRoZXNlIGVy
cm9ycyBhcmUgbWlnaHQgYmUgYmVjYXVzZSBvZiBsaW51eC9tb3VudC5oIGlzIG5vdCBpbmNsdWRl
ZC4gVGhpcyBwYXRjaCByZXNvbHZlcyB0aGF0IGlzc3VlLgoKU2lnbmVkLW9mZi1ieTogQW5oIFR1
YW4gUGhhbiA8dHVhbmFuaGxmY0BnbWFpbC5jb20+Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvbW91bnRfc2V0YXR0ci9tb3VudF9zZXRhdHRyX3Rlc3QuYyB8IDEgKwogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
bW91bnRfc2V0YXR0ci9tb3VudF9zZXRhdHRyX3Rlc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL21vdW50X3NldGF0dHIvbW91bnRfc2V0YXR0cl90ZXN0LmMKaW5kZXggNTgyNjY5Y2EzOGU5
Li43Y2ExM2E5MjRlMzQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL21vdW50
X3NldGF0dHIvbW91bnRfc2V0YXR0cl90ZXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvbW91bnRfc2V0YXR0ci9tb3VudF9zZXRhdHRyX3Rlc3QuYwpAQCAtMTgsNiArMTgsNyBAQAog
I2luY2x1ZGUgPGdycC5oPgogI2luY2x1ZGUgPHN0ZGJvb2wuaD4KICNpbmNsdWRlIDxzdGRhcmcu
aD4KKyNpbmNsdWRlICJsaW51eC9tb3VudC5oIgogCiAjaW5jbHVkZSAiLi4va3NlbGZ0ZXN0X2hh
cm5lc3MuaCIKIAotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2Vy
bmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
