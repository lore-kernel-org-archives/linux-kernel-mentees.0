Return-Path: <SRS0=8PjG=QF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E33C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:06:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1355C61B1B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1355C61B1B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D39AC403C7;
	Thu, 18 Nov 2021 14:06:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I4706mQ6woLg; Thu, 18 Nov 2021 14:06:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 07EC4403D1;
	Thu, 18 Nov 2021 14:06:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8BB1C001E;
	Thu, 18 Nov 2021 14:06:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE998C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD74060792
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:06:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VV6DzMGlNpGF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:06:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6071F60761
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:06:44 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id 8so6124191pfo.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 06:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n/yt+ar9LeJXp+LgPRjnz08fHYE7Y6D7uP8N5v1qSeQ=;
 b=ju5IgyBkawORLGdE5+lvjqmVMlAJUBHJQunyAtZAHZeDq2OXPFfbOCXZ/z6XcreEmd
 8Gb5fyu/w7VxIygaGX06SKEUiejhTJb+VroQuBSLQUew7HaeAiJfxxhAxBh34f7i2HVA
 zZM8dL5hfTR+iWHlqmLBHG8qMmBc0uN9ZJv4QqsaMEP4gN5rV+7WFHhuoQqxkXQmhCNL
 d23U7KjYdmtAVrH8eLX9VAmblo3HQd9kc60htoY0gkWIRoKbUOclN4VQnRhKvWgB+EUG
 7fMw/n104iCAB9CKf0WenkQ88x3KHJfrQwgovVliRSHPm22klNnEiPbspoDUXf++2rH7
 C6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n/yt+ar9LeJXp+LgPRjnz08fHYE7Y6D7uP8N5v1qSeQ=;
 b=s8G9ZHZ3rk1I0UZ1/1pAONS9iOR9pI4YDWzhPocJKq+/FUh6BCwo3r4RYJgDdnVWPV
 zGfoLp3B1W34i3b60FzBEJYwwfYkzviTGjBIzHg5qMKmJ+bLbSB8nLX5Z38a0tqk2yF4
 neE3hDdKf0MelUKVty+YDGHoq0ThckHYtgDIQci7Le9snIM2R+3KeM8pDqS+u/QKVW0a
 O0+qLgOqMEeBil8t/wFMPHf62xXoWyYoKG/1v1gMSdZz52Gw3uRp2FM5MWhbgMODj5gy
 X/6h/6CNff9GIJZEi2PC1EPzpKHxC2WZNEOX5yPnihDhNL3rPG2lvbxh8wVujW0AYMo/
 Q7jA==
X-Gm-Message-State: AOAM533iJgZVSvGFQkKrQb3P8NefDTs6nzylToiSQb8zn/Al/aUbNrl9
 u5d44gxW/3FebkNqfVqEsvE=
X-Google-Smtp-Source: ABdhPJwRC2+Zew+d+pDpceltjCbSl2htV5tAPVKvoWCpsnfdWeC89UX5XOOHSvDvVdy5CjvvBZKwLg==
X-Received: by 2002:a05:6a00:2283:b0:49f:dea0:b9ba with SMTP id
 f3-20020a056a00228300b0049fdea0b9bamr15379492pfe.56.1637244403560; 
 Thu, 18 Nov 2021 06:06:43 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:63:2c47:5ffe:fc34:61f0:f1ea])
 by smtp.gmail.com with ESMTPSA id
 x14sm2822878pjl.27.2021.11.18.06.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:06:43 -0800 (PST)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v4 11/25] PCI: aardvark: Remove redundant error fabrication
 when device read fails
Date: Thu, 18 Nov 2021 19:33:21 +0530
Message-Id: <335014f2b44cdf24ed1e37cb7c88f6c5de896cc2.1637243717.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1637243717.git.naveennaidu479@gmail.com>
References: <cover.1637243717.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 "moderated list:PCI DRIVER FOR AARDVARK Marvell Armada 3700"
 <linux-arm-kernel@lists.infradead.org>
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
cyB+MCBkYXRhLgoKVGhlIGhvc3QgY29udHJvbGxlciBkcml2ZXJzIHNldHMgdGhlIGVycm9yIHJl
c3BvbnNlIHZhbHVlcyAofjApIGFuZApyZXR1cm5zIGFuIGVycm9yIHdoZW4gZmF1bHR5IGhhcmR3
YXJlIHJlYWQgb2NjdXJzLiBCdXQgdGhlIGVycm9yCnJlc3BvbnNlIHZhbHVlICh+MCkgaXMgYWxy
ZWFkeSBiZWluZyBzZXQgaW4gUENJX09QX1JFQUQgYW5kClBDSV9VU0VSX1JFQURfQ09ORklHIHdo
ZW5ldmVyIGEgcmVhZCBieSBob3N0IGNvbnRyb2xsZXIgZHJpdmVyIGZhaWxzLgoKVGh1cywgaXQn
cyBubyBsb25nZXIgbmVjZXNzYXJ5IGZvciB0aGUgaG9zdCBjb250cm9sbGVyIGRyaXZlcnMgdG8K
ZmFicmljYXRlIGFueSBlcnJvciByZXNwb25zZS4KClRoaXMgaGVscHMgdW5pZnkgUENJIGVycm9y
IHJlc3BvbnNlIGNoZWNraW5nIGFuZCBtYWtlIGVycm9yIGNoZWNrCmNvbnNpc3RlbnQgYW5kIGVh
c2llciB0byBmaW5kLgoKUmV2aWV3ZWQtYnk6IFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5vcmc+
ClNpZ25lZC1vZmYtYnk6IE5hdmVlbiBOYWlkdSA8bmF2ZWVubmFpZHU0NzlAZ21haWwuY29tPgot
LS0KIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpLWFhcmR2YXJrLmMgfCA0ICstLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS1hYXJkdmFyay5jIGIvZHJpdmVycy9wY2kvY29udHJv
bGxlci9wY2ktYWFyZHZhcmsuYwppbmRleCBjNTMwMGQ0OTgwN2EuLjFkZTQxZDJjOWI0NCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2ktYWFyZHZhcmsuYworKysgYi9kcml2
ZXJzL3BjaS9jb250cm9sbGVyL3BjaS1hYXJkdmFyay5jCkBAIC0xMDI2LDEwICsxMDI2LDggQEAg
c3RhdGljIGludCBhZHZrX3BjaWVfcmRfY29uZihzdHJ1Y3QgcGNpX2J1cyAqYnVzLCB1MzIgZGV2
Zm4sCiAJdTMyIHJlZzsKIAlpbnQgcmV0OwogCi0JaWYgKCFhZHZrX3BjaWVfdmFsaWRfZGV2aWNl
KHBjaWUsIGJ1cywgZGV2Zm4pKSB7Ci0JCSp2YWwgPSAweGZmZmZmZmZmOworCWlmICghYWR2a19w
Y2llX3ZhbGlkX2RldmljZShwY2llLCBidXMsIGRldmZuKSkKIAkJcmV0dXJuIFBDSUJJT1NfREVW
SUNFX05PVF9GT1VORDsKLQl9CiAKIAlpZiAocGNpX2lzX3Jvb3RfYnVzKGJ1cykpCiAJCXJldHVy
biBwY2lfYnJpZGdlX2VtdWxfY29uZl9yZWFkKCZwY2llLT5icmlkZ2UsIHdoZXJlLAotLSAKMi4y
NS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
