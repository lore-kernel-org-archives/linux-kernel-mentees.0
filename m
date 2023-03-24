Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9890FC6FD1C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Mar 2023 02:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1486860E5D;
	Fri, 24 Mar 2023 02:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1486860E5D
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qKECIUkH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EEIiWmjHRgtV; Fri, 24 Mar 2023 02:14:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 49C4060C12;
	Fri, 24 Mar 2023 02:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49C4060C12
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23688C0035;
	Fri, 24 Mar 2023 02:14:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98389C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 02:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CD3F81FBE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 02:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CD3F81FBE
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qKECIUkH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CCLJRw95qull
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 02:14:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C982481ED4
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C982481ED4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 02:14:27 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id bc12so639023plb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Mar 2023 19:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679624067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DjZ8tIr/PF8OJoYSDIjMzoT6havTlKl8dZ9y/Hrp13w=;
 b=qKECIUkHVbjZx7eY07qrnQUNaRjut4Aq+BCaYeyZW3CbhzrPFyHxWkBwxz3M6pEXLH
 9nK+tSd5Ece2GHNkYeTq0ab3JStx/jBtBZENITfvCjitU8N5nDDlkGAnomH568vIYV1Y
 oD6ve+pKeIZ18KIDN+NlqJk3jh0B4DUH2eHz/Rrg+n/4RpKO/2PMg0s154MqnGIiYvni
 cnqQWbN/lANKekY4gQ5VAlOKHGwfJPil70hl7KBg2tbnXELpbBV0ENunlZ6emYmZDiuV
 /CArHbuFUCQOwkOI+oYbE4jbLYMfj7LsSh1k776KD9fne3OpuXo8kpadq5cxrlV8euHs
 hNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679624067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DjZ8tIr/PF8OJoYSDIjMzoT6havTlKl8dZ9y/Hrp13w=;
 b=QSgDVNaXf0degTOsbeyBCqVNv0+MEFPob0u7bmFycJx45C4UdGag5m0O/MDV5sKCbE
 Vv/9w2lDjqgntlKopRB+hDLIjrwhIA62jtbWfcsGxzxRYy19wMeeNcWSqf5XoX+XUjSa
 1lbr3IamQLAQQJLg/StXG7OfRF6ZPk5puLPukK6Dk1gXe+rh081ppZ5PrKdaGMOtH007
 FRFMGsm+5u7dj9rEKt513Wi+0oSFcEjrDVJVblX6086kX3BXn3EE6yiLZrOeCoGw8qrF
 pzpe84h1xmhSyUZhYTRTNX8VRZFOmiVKO9Vvcyg9fABgqrXU8UEKRkXb+uxoKwsduDxc
 /ncQ==
X-Gm-Message-State: AO0yUKVroHa3bWaeV8twZOsvsmkYRQaXuePCHWNR29OpUJjbL+r5UhVD
 DYObBoX4Ml3fWh4vzRqMIEE=
X-Google-Smtp-Source: AK7set8OImd5shd8MnxakXcmYgfHCdt7YJw9IFjm44AA+74PF6ay96ajaQUMywf4qOtIzLWNeAc73g==
X-Received: by 2002:a05:6a20:811a:b0:d5:7704:f362 with SMTP id
 g26-20020a056a20811a00b000d57704f362mr1382121pza.56.1679624066965; 
 Thu, 23 Mar 2023 19:14:26 -0700 (PDT)
Received: from pop-os.lan ([14.232.107.112]) by smtp.gmail.com with ESMTPSA id
 d16-20020aa78150000000b005825b8e0540sm12547010pfn.204.2023.03.23.19.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 19:14:26 -0700 (PDT)
From: Anh Tuan Phan <tuananhlfc@gmail.com>
To: sforshee@kernel.org
Subject: [PATCH v2 1/1] selftests mount: Fix mount_setattr_test builds failed
Date: Fri, 24 Mar 2023 09:14:15 +0700
Message-Id: <20230324021415.17416-1-tuananhlfc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZByVac3GsD7RFuaj@do-x1extreme>
References: <ZByVac3GsD7RFuaj@do-x1extreme>
MIME-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org, shuah@kernel.org, brauner@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, tuananhlfc@gmail.com
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
cm9ycyBtaWdodCBiZSBiZWNhdXNlIG9mIGxpbnV4L21vdW50LmggaXMgbm90IGluY2x1ZGVkLiBU
aGlzIHBhdGNoIHJlc29sdmVzIHRoYXQgaXNzdWUuCgpTaWduZWQtb2ZmLWJ5OiBBbmggVHVhbiBQ
aGFuIDx0dWFuYW5obGZjQGdtYWlsLmNvbT4KLS0tClRoYW5rcyBmb3IgcmVwbHlpbmcgc28gcXVp
Y2tseSwgdGhpcyBpcyBteSBmaXJzdCBwYXRjaCB0byB0aGUga2VybmVsLiBJCmNoYW5nZWQgdGhl
IGluY2x1ZGUgdG8gdXNlIGFuZ2xlIGJyYWNrZXQgYXMgeW91ciBzdWdnZXN0aW9uLgoKIHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL21vdW50X3NldGF0dHIvbW91bnRfc2V0YXR0cl90ZXN0LmMgfCAx
ICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL21vdW50X3NldGF0dHIvbW91bnRfc2V0YXR0cl90ZXN0LmMgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9tb3VudF9zZXRhdHRyL21vdW50X3NldGF0dHJfdGVzdC5jCmlu
ZGV4IDU4MjY2OWNhMzhlOS4uYzZhOGM3MzJiODAyIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9tb3VudF9zZXRhdHRyL21vdW50X3NldGF0dHJfdGVzdC5jCisrKyBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL21vdW50X3NldGF0dHIvbW91bnRfc2V0YXR0cl90ZXN0LmMKQEAg
LTE4LDYgKzE4LDcgQEAKICNpbmNsdWRlIDxncnAuaD4KICNpbmNsdWRlIDxzdGRib29sLmg+CiAj
aW5jbHVkZSA8c3RkYXJnLmg+CisjaW5jbHVkZSA8bGludXgvbW91bnQuaD4KIAogI2luY2x1ZGUg
Ii4uL2tzZWxmdGVzdF9oYXJuZXNzLmgiCiAKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGlu
ZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2Vy
bmVsLW1lbnRlZXMK
