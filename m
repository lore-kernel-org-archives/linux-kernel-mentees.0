Return-Path: <SRS0=C2G1=J4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40EDC433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 May 2021 05:50:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51DA2613F0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 May 2021 05:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51DA2613F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C9C4606EA;
	Sat,  1 May 2021 05:50:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5XWhxJn2uD41; Sat,  1 May 2021 05:50:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44D1E606BB;
	Sat,  1 May 2021 05:50:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21F47C000D;
	Sat,  1 May 2021 05:50:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D116C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 May 2021 05:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34586606BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 May 2021 05:50:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7qXiYlUpN4TM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 May 2021 05:50:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A42C3606B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 May 2021 05:50:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1619848231; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MEuaBE865UaMq2cEXsOrNCuINnEI2NKO5mtAPluD0Xm16H/M9yx/NSyBCvB6WiHIKqZr1QK4JK7OLSqbRJlJ/OWays7iMGF5mMAMHk9YC8Pfu0DT0XfYJirahZ7IulVJ/FYNgfd/+C9r8SeUbHCkyJKRUK3ONZSpL5gQF0KVHT0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1619848231;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=6A9yXCsgHIpBF4gz2/JnwOLwuTHlW112ZF9OkzGdxaU=; 
 b=BAtEHIRvtgzrf75FxzoFbTDT7s1XehXHDry/yN1AcLcl5YLVHmwtJSlBDAYmwpXY+1rANDM5p7KichOnT7+vgqUQzSWEi8ss0mPj0sqZumCF3jeVC6UeDShQLTwhd+I2iPNZJSdjJsw7VjP43wScKfuXeeOTm6uZMYIUol1/J90=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com> header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1619848231; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=6A9yXCsgHIpBF4gz2/JnwOLwuTHlW112ZF9OkzGdxaU=;
 b=qsNTF+jjZ695CrjqHkWwIVmWCFbdW0L0fPwzoUh2ZD79N7ogD028wV063HI9JjPs
 m9Johr7bvhGhJpMaZlmhXj4R1rReH/rV9vqNQnRA3/uZfNy5/VUREk90bgxgGIbrb5M
 nb+Sqc0LwxbUMgGXcsYimTfnzuY1Gf1WfLfb1Dq4=
Received: from localhost.localdomain (49.207.211.62 [49.207.211.62]) by
 mx.zohomail.com with SMTPS id 1619848228732115.49195201466569;
 Fri, 30 Apr 2021 22:50:28 -0700 (PDT)
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: Matt Porter <mporter@kernel.crashing.org>,
 Alexandre Bounine <alex.bou9@gmail.com>
Subject: [PATCH] rapidio: remove unused variable in rio_cm.c
Date: Sat,  1 May 2021 11:20:17 +0530
Message-Id: <20210501055018.9244-1-mail@anirudhrb.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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

UmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAncmMnIHRvIGZpeCBnY2Mgd2FybmluZzoKCglkcml2ZXJz
L3JhcGlkaW8vcmlvX2NtLmM6IEluIGZ1bmN0aW9uIOKAmHJpb190eGNxX2hhbmRsZXLigJk6Cglk
cml2ZXJzL3JhcGlkaW8vcmlvX2NtLmM6NjczOjc6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJj4oCZ
IHNldCBidXQKCW5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKU2lnbmVkLW9m
Zi1ieTogQW5pcnVkaCBSYXlhYmhhcmFtIDxtYWlsQGFuaXJ1ZGhyYi5jb20+Ci0tLQogZHJpdmVy
cy9yYXBpZGlvL3Jpb19jbS5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3JhcGlkaW8vcmlvX2NtLmMg
Yi9kcml2ZXJzL3JhcGlkaW8vcmlvX2NtLmMKaW5kZXggNTBlYzUzZDY3YTRjLi41NDU2OTNiZDg2
YTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcmFwaWRpby9yaW9fY20uYworKysgYi9kcml2ZXJzL3Jh
cGlkaW8vcmlvX2NtLmMKQEAgLTY3MCwxMiArNjcwLDExIEBAIHN0YXRpYyB2b2lkIHJpb190eGNx
X2hhbmRsZXIoc3RydWN0IGNtX2RldiAqY20sIGludCBzbG90KQogCSAqLwogCWlmICghbGlzdF9l
bXB0eSgmY20tPnR4X3JlcXMpICYmIChjbS0+dHhfY250IDwgUklPQ01fVFhfUklOR19TSVpFKSkg
ewogCQlzdHJ1Y3QgdHhfcmVxICpyZXEsICpfcmVxOwotCQlpbnQgcmM7CiAKIAkJbGlzdF9mb3Jf
ZWFjaF9lbnRyeV9zYWZlKHJlcSwgX3JlcSwgJmNtLT50eF9yZXFzLCBub2RlKSB7CiAJCQlsaXN0
X2RlbCgmcmVxLT5ub2RlKTsKIAkJCWNtLT50eF9idWZbY20tPnR4X3Nsb3RdID0gcmVxLT5idWZm
ZXI7Ci0JCQlyYyA9IHJpb19hZGRfb3V0Yl9tZXNzYWdlKGNtLT5tcG9ydCwgcmVxLT5yZGV2LCBj
bWJveCwKKwkJCXJpb19hZGRfb3V0Yl9tZXNzYWdlKGNtLT5tcG9ydCwgcmVxLT5yZGV2LCBjbWJv
eCwKIAkJCQkJCSAgcmVxLT5idWZmZXIsIHJlcS0+bGVuKTsKIAkJCWtmcmVlKHJlcS0+YnVmZmVy
KTsKIAkJCWtmcmVlKHJlcSk7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApM
aW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50
ZWVzCg==
