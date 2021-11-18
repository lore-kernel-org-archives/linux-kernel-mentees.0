Return-Path: <SRS0=8PjG=QF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2C1C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:05:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E178260EFD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E178260EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3517403D7;
	Thu, 18 Nov 2021 14:05:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AiX7-uTPeVMB; Thu, 18 Nov 2021 14:05:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EFCB740342;
	Thu, 18 Nov 2021 14:05:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA2DEC001E;
	Thu, 18 Nov 2021 14:05:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A13FC0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E032D403D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1FxR9K6rJ-tQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:04:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FD8540342
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:04:58 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 p18-20020a17090ad31200b001a78bb52876so8277041pju.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 06:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wlP4fOTykbzU+g6/cyJ7zYPFE/ryfY0EbZlV8FvMVqc=;
 b=QMZKVQdPimZWc3wObLr6wjuQGAwHXkdQDB35x1/7IsVYaRyQu4fqsUSWsoDVljOFp2
 AlNYLrnHMAWyb3/pzbxu+DGmWyu+RVv0uKekuGFYlopisJ0EfzpVYA/tWjPfMNO5bg8s
 mJ97HEoGIP6eIjyy1qAc0Km4T1VD/m7A/25keQriLTkppDl7WVBKrI55CEMOCGX2QvGr
 rdrAlZwTBdJe81puVKg/rTmj5A/DVX7qJf28eVjZBjUCV3ifDJgTvTqzoAkWRV6pcYM2
 IPbrH7LEBG8rT2Fw4QbL6ZHIwMlDNXFEjr2eK9hA1AgGZQggJ0MYUYBNS97vHkh3VFiK
 x/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wlP4fOTykbzU+g6/cyJ7zYPFE/ryfY0EbZlV8FvMVqc=;
 b=VFs+dd6W1+KG5qWxrd+MiUMTyfGzDaxCa9sovPXizA04RLBjkCHUA2ay5kYk8q+zWW
 wmhpTs/Kbgl0UCihwQAkRep9GrIHEizuCNJ/1W0jWSp5q+5A6SNcNxXHCzjnt/YTT9jP
 mz1WNALT6bV62eqw3V6+750pA56AQwJ8FasuLpYIK51v1M42g5icwstkZBeAEkBN2Mba
 PTAIq89yxp4Pg5D3ckSJUlU9XK4WIGjEhsNKwktEZn9V5IzU3Q1dNrSjJ1kpBgN/bC3B
 zZX4HKU4vXLqqVqUd9+ORPHHzcHgnCXvs11VqwmgzRstLfMGFPllYqq77hSUD7Zf+4/a
 2g1A==
X-Gm-Message-State: AOAM531qtbDC009xwujB5TfhtKF3JTX+birrb299lgALhgNbxud6rydv
 FN9Y8BEJ+TndcbBqmBv8igk=
X-Google-Smtp-Source: ABdhPJyqiWgfNZtzNB6ARnHM9Du0xQAnLthgWfbNHaay3g2LSkWtotEgtBlLYBTm34GwuWKUyw8oaA==
X-Received: by 2002:a17:903:32c2:b0:141:eed4:ec1c with SMTP id
 i2-20020a17090332c200b00141eed4ec1cmr67258899plr.33.1637244297661; 
 Thu, 18 Nov 2021 06:04:57 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:63:2c47:5ffe:fc34:61f0:f1ea])
 by smtp.gmail.com with ESMTPSA id
 x14sm2822878pjl.27.2021.11.18.06.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:04:57 -0800 (PST)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v4 02/25] PCI: Set error response in config access defines
 when ops->read() fails
Date: Thu, 18 Nov 2021 19:33:12 +0530
Message-Id: <4188fc5465631ce0d472d1423de3d9fb2f09b8ff.1637243717.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1637243717.git.naveennaidu479@gmail.com>
References: <cover.1637243717.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

TWFrZSBQQ0lfT1BfUkVBRCBhbmQgUENJX1VTRVJfUkVBRF9DT05GSUcgc2V0IHRoZSBkYXRhIHZh
bHVlIHdpdGggZXJyb3IKcmVzcG9uc2UgKH4wKSwgd2hlbiB0aGUgUENJIGRldmljZSByZWFkIGJ5
IGEgaG9zdCBjb250cm9sbGVyIGZhaWxzLgoKVGhpcyBlbnN1cmVzIHRoYXQgdGhlIGNvbnRyb2xs
ZXIgZHJpdmVycyBubyBsb25nZXIgbmVlZCB0byBmYWJyaWNhdGUKKH4wKSB2YWx1ZSB3aGVuIHRo
ZXkgZGV0ZWN0IGVycm9yLiBJdCBhbHNvICBndXJhbnRlZXMgdGhhdCB0aGUgZXJyb3IKcmVzcG9u
c2UgKH4wKSBpcyBhbHdheXMgc2V0IHdoZW4gdGhlIGNvbnRyb2xsZXIgZHJpdmVycyBmYWlscyB0
byByZWFkIGEKY29uZmlnIHJlZ2lzdGVyIGZyb20gYSBkZXZpY2UuCgpUaGlzIG1ha2VzIGVycm9y
IHJlc3BvbnNlIGZhYnJpY2F0aW9uIGNvbnNpc3RlbnQgYW5kIGhlbHBzIGluIHJlbW92YWwgb2YK
YSBsb3Qgb2YgcmVwZWF0ZWQgY29kZS4KClN1Z2dlc3RlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4KUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+ClJl
dmlld2VkLWJ5OiBQYWxpIFJvaMOhciA8cGFsaUBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBO
YXZlZW4gTmFpZHUgPG5hdmVlbm5haWR1NDc5QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3BjaS9h
Y2Nlc3MuYyB8IDEwICsrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvYWNjZXNzLmMgYi9kcml2
ZXJzL3BjaS9hY2Nlc3MuYwppbmRleCA0NjkzNTY5NWNmYjkuLmVhYzA3NjVkOGJlZCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9wY2kvYWNjZXNzLmMKKysrIGIvZHJpdmVycy9wY2kvYWNjZXNzLmMKQEAg
LTQyLDcgKzQyLDEwIEBAIGludCBub2lubGluZSBwY2lfYnVzX3JlYWRfY29uZmlnXyMjc2l6ZSBc
CiAJaWYgKFBDSV8jI3NpemUjI19CQUQpIHJldHVybiBQQ0lCSU9TX0JBRF9SRUdJU1RFUl9OVU1C
RVI7CVwKIAlwY2lfbG9ja19jb25maWcoZmxhZ3MpOwkJCQkJCVwKIAlyZXMgPSBidXMtPm9wcy0+
cmVhZChidXMsIGRldmZuLCBwb3MsIGxlbiwgJmRhdGEpOwkJXAotCSp2YWx1ZSA9ICh0eXBlKWRh
dGE7CQkJCQkJXAorCWlmIChyZXMpCQkJCQkJCVwKKwkJUENJX1NFVF9FUlJPUl9SRVNQT05TRSh2
YWx1ZSk7CQkJCVwKKwllbHNlCQkJCQkJCQlcCisJCSp2YWx1ZSA9ICh0eXBlKWRhdGE7CQkJCQlc
CiAJcGNpX3VubG9ja19jb25maWcoZmxhZ3MpOwkJCQkJXAogCXJldHVybiByZXM7CQkJCQkJCVwK
IH0KQEAgLTIyOCw3ICsyMzEsMTAgQEAgaW50IHBjaV91c2VyX3JlYWRfY29uZmlnXyMjc2l6ZQkJ
CQkJCVwKIAlyZXQgPSBkZXYtPmJ1cy0+b3BzLT5yZWFkKGRldi0+YnVzLCBkZXYtPmRldmZuLAkJ
CVwKIAkJCQkJcG9zLCBzaXplb2YodHlwZSksICZkYXRhKTsJXAogCXJhd19zcGluX3VubG9ja19p
cnEoJnBjaV9sb2NrKTsJCQkJXAotCSp2YWwgPSAodHlwZSlkYXRhOwkJCQkJCVwKKwlpZiAocmV0
KQkJCQkJCQlcCisJCVBDSV9TRVRfRVJST1JfUkVTUE9OU0UodmFsKTsJCQkJXAorCWVsc2UJCQkJ
CQkJCVwKKwkJKnZhbCA9ICh0eXBlKWRhdGE7CQkJCQlcCiAJcmV0dXJuIHBjaWJpb3NfZXJyX3Rv
X2Vycm5vKHJldCk7CQkJCVwKIH0JCQkJCQkJCQlcCiBFWFBPUlRfU1lNQk9MX0dQTChwY2lfdXNl
cl9yZWFkX2NvbmZpZ18jI3NpemUpOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxp
c3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwt
bWVudGVlcwo=
