Return-Path: <SRS0=8PjG=QF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D70C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:04:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3C8861107
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3C8861107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B027381776;
	Thu, 18 Nov 2021 14:04:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sndc2IDAHPFC; Thu, 18 Nov 2021 14:04:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D58EA8176A;
	Thu, 18 Nov 2021 14:04:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B458DC001E;
	Thu, 18 Nov 2021 14:04:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94A09C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75A0A60767
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:04:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vx42DuCHLQ8X
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:04:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F328D60761
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:04:36 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id r23so5370277pgu.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 06:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lRVr/MvmbDbYCYZVQvovIm632g48TSctaBpAr4pPMBs=;
 b=ki3zJclRT5gZaLLE08IwbhWAxIbTzKFMLWGKODRFKxJMYkkPV57hmCyWQs7c+DPosB
 5mGT3f3d4Xo32+oDwKv9/J9AYz0Y6ZUF4Ipfd/dezlJppudIle8DSVT2t52Axq6FE2ot
 pk0I9ygiRZzF/58Mf0M0Iyyx4J1CAb84WkGwpfjx/lMlEYg2kQ6SLyCGodPMAHwZpthr
 zUord0VXRyBh+6WBJIxc+wTFGBSTEJ4ll7/W3L4JjXvX//SDdLbzbAeJorDa2ip/qyCV
 uafNAyEYulpT3XpNjH5DhcLk5X+YBwhuElAMWAST4BDJSDBuEF6VmBIm/tNDUMfCBcUf
 knMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lRVr/MvmbDbYCYZVQvovIm632g48TSctaBpAr4pPMBs=;
 b=olTJiP0MBlZuy4ePGo5ugHdgtHsmAzgsPLtGdt2e55NUT99/2R/liOtZRhHDcqBYZa
 L6lTTaTWIjCMtwV0Pf8YJjPVxUlgBOlcVLOAsHW6d9d22wj4PpQJ7eqwMQTAKS2tnijF
 Ild82fFsRlzaEYnDryzWhftn2qKqbZcThZkT+xmvUnl7KLmqWP/YTEzF0UO6t4kInySC
 X4ywBp4QeRBRQ0xJmuKDE5mHX/51Ol951RDB1+QodxwqlaiWleKeJnSLVTaHvNOaINjK
 NjejAs/w1RZZnmAwCyx9gfQOBT0gWgS7GLFcirwROIv82Djeph4gmWQ3duywD3Ycp7QJ
 yh0g==
X-Gm-Message-State: AOAM533FXTyAPwW1XbH2fPYZsRNZdMpVqChij052QQUx7//RRejmkrfu
 oApTyaaSKCilWLRoIF5suwc=
X-Google-Smtp-Source: ABdhPJwgSJAJzb9GnmZhNCiuC4sXvl/+OpI7uHAkOxqyhJ9kXcl1osCLvoOYPljMeoii6U1rnBhr8w==
X-Received: by 2002:a05:6a00:24cd:b0:49f:bf3f:c42c with SMTP id
 d13-20020a056a0024cd00b0049fbf3fc42cmr15229341pfv.54.1637244276068; 
 Thu, 18 Nov 2021 06:04:36 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:63:2c47:5ffe:fc34:61f0:f1ea])
 by smtp.gmail.com with ESMTPSA id
 x14sm2822878pjl.27.2021.11.18.06.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:04:35 -0800 (PST)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v4 01/25] PCI: Add PCI_ERROR_RESPONSE and it's related
 definitions
Date: Thu, 18 Nov 2021 19:33:11 +0530
Message-Id: <55563bf4dfc5d3fdc96695373c659d099bf175b1.1637243717.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1637243717.git.naveennaidu479@gmail.com>
References: <cover.1637243717.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
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

QW4gTU1JTyByZWFkIGZyb20gYSBQQ0kgZGV2aWNlIHRoYXQgZG9lc24ndCBleGlzdCBvciBkb2Vz
bid0IHJlc3BvbmQKY2F1c2VzIGEgUENJIGVycm9yLiBUaGVyZSdzIG5vIHJlYWwgZGF0YSB0byBy
ZXR1cm4gdG8gc2F0aXNmeSB0aGUKQ1BVIHJlYWQsIHNvIG1vc3QgaGFyZHdhcmUgZmFicmljYXRl
cyB+MCBkYXRhLgoKQWRkIGEgUENJX0VSUk9SX1JFU1BPTlNFIGRlZmluaXRpb24gZm9yIHRoYXQg
YW5kIHVzZSBpdCB3aGVyZQphcHByb3ByaWF0ZSB0byBtYWtlIHRoZXNlIGNoZWNrcyBjb25zaXN0
ZW50IGFuZCBlYXNpZXIgdG8gZmluZC4KCkFsc28gYWRkIGhlbHBlciBkZWZpbml0aW9ucyBQQ0lf
U0VUX0VSUk9SX1JFU1BPTlNFIGFuZApQQ0lfUE9TU0lCTEVfRVJST1IgdG8gbWFrZSB0aGUgY29k
ZSBtb3JlIHJlYWRhYmxlLgoKU3VnZ2VzdGVkLWJ5OiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bn
b29nbGUuY29tPgpSZXZpZXdlZC1ieTogUGFsaSBSb2jDoXIgPHBhbGlAa2VybmVsLm9yZz4KU2ln
bmVkLW9mZi1ieTogTmF2ZWVuIE5haWR1IDxuYXZlZW5uYWlkdTQ3OUBnbWFpbC5jb20+Ci0tLQog
aW5jbHVkZS9saW51eC9wY2kuaCB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wY2kuaCBiL2luY2x1ZGUvbGlu
dXgvcGNpLmgKaW5kZXggMThhNzVjOGU2MTVjLi4wY2UyNjg1MDQ3MGUgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvbGludXgvcGNpLmgKKysrIGIvaW5jbHVkZS9saW51eC9wY2kuaApAQCAtMTU0LDYgKzE1
NCwxNSBAQCBlbnVtIHBjaV9pbnRlcnJ1cHRfcGluIHsKIC8qIFRoZSBudW1iZXIgb2YgbGVnYWN5
IFBDSSBJTlR4IGludGVycnVwdHMgKi8KICNkZWZpbmUgUENJX05VTV9JTlRYCTQKIAorLyoKKyAq
IFJlYWRpbmcgZnJvbSBhIGRldmljZSB0aGF0IGRvZXNuJ3QgcmVzcG9uZCB0eXBpY2FsbHkgcmV0
dXJucyB+MC4gIEEKKyAqIHN1Y2Nlc3NmdWwgcmVhZCBmcm9tIGEgZGV2aWNlIG1heSBhbHNvIHJl
dHVybiB+MCwgc28geW91IG5lZWQgYWRkaXRpb25hbAorICogaW5mb3JtYXRpb24gdG8gcmVsaWFi
bHkgaWRlbnRpZnkgZXJyb3JzLgorICovCisjZGVmaW5lIFBDSV9FUlJPUl9SRVNQT05TRQkJKH4w
VUxMKQorI2RlZmluZSBQQ0lfU0VUX0VSUk9SX1JFU1BPTlNFKHZhbCkJKCoodmFsKSA9ICgodHlw
ZW9mKCoodmFsKSkpIFBDSV9FUlJPUl9SRVNQT05TRSkpCisjZGVmaW5lIFBDSV9QT1NTSUJMRV9F
UlJPUih2YWwpCQkoKHZhbCkgPT0gKCh0eXBlb2YodmFsKSkgUENJX0VSUk9SX1JFU1BPTlNFKSkK
KwogLyoKICAqIHBjaV9wb3dlcl90IHZhbHVlcyBtdXN0IG1hdGNoIHRoZSBiaXRzIGluIHRoZSBD
YXBhYmlsaXRpZXMgUE1FX1N1cHBvcnQKICAqIGFuZCBDb250cm9sL1N0YXR1cyBQb3dlclN0YXRl
IGZpZWxkcyBpbiB0aGUgUG93ZXIgTWFuYWdlbWVudCBjYXBhYmlsaXR5LgotLSAKMi4yNS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJu
ZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
