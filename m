Return-Path: <SRS0=r9JU=KB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B532C43460
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 May 2021 18:19:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97A076103E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 May 2021 18:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97A076103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B95360E1B;
	Thu,  6 May 2021 18:19:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N5R6alNfQJ1e; Thu,  6 May 2021 18:19:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AA7160732;
	Thu,  6 May 2021 18:19:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A47BC000E;
	Thu,  6 May 2021 18:19:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15837C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 May 2021 18:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02EFF40524
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 May 2021 18:19:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=anirudhrb.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ljnZeihuSsCJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 May 2021 18:19:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A8E84051A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 May 2021 18:19:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1620325155; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KXH6ODj9YZy7EfbkPcfjkM+XlsXfwz397wyKPn9GPHskq/9XSgXxLvskAh7b3IuNp5BqWQEkoF4I/t7OL+TlxVlcjilx9Th88F6LdlJcmd7EXPsfUviIf7YrfWwz2tGzUMflzUguq7t0hRs/0vJgNAKEzCVoqfzUKT+kEpdKPmI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1620325155;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=6DDF2B6OrMM0QxGNsdtFui4c6DfEyuwe9HcAxJ1ve7M=; 
 b=PUCjhE+eFwCtUUjTN/rtTnyQ7FxPmXF7d/N+lNlmfryd8L5Jz2fNcMzSKaH4LV3zqYG34co5g0OqIjw7MjZb4Gyw6h8+rvIs6HTEu6sfLXtX9P3/i9KvGr5X/Ive84FOM0z2p9UYvdAd7sbFvub8wgxwZO9vLCs8dPgurutCBNQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com> header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1620325155; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=6DDF2B6OrMM0QxGNsdtFui4c6DfEyuwe9HcAxJ1ve7M=;
 b=MIDzm1rtNT6eSuKiaT8tBDlIfhXPuM2GqIjk3hiech6UoIkTP7VFnfw6AdbgKkqm
 QuXqS72qjniH5CaWVJmQYOLE1rf/dcd5rB5veGYyM5hoo07JdqhjTq/t2JCIEPvtcxE
 BXHZBpyY/2TR/2tCoUmHJLZhWsoPKgDyQS9kq8y8=
Received: from localhost.localdomain (49.207.210.243 [49.207.210.243]) by
 mx.zohomail.com with SMTPS id 1620325151474625.7325176070485;
 Thu, 6 May 2021 11:19:11 -0700 (PDT)
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: Matt Porter <mporter@kernel.crashing.org>,
 Alexandre Bounine <alex.bou9@gmail.com>
Subject: [PATCH v2] rapidio: fix unused variable warning in rio_cm.c
Date: Thu,  6 May 2021 23:48:36 +0530
Message-Id: <20210506181837.4758-1-mail@anirudhrb.com>
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

R0NDIHByb2R1Y2VzIGFuIHVudXNlZCB2YXJpYWJsZSB3YXJuaW5nIGZvciAncmMnOgoKCWRyaXZl
cnMvcmFwaWRpby9yaW9fY20uYzogSW4gZnVuY3Rpb24g4oCYcmlvX3R4Y3FfaGFuZGxlcuKAmToK
CWRyaXZlcnMvcmFwaWRpby9yaW9fY20uYzo2NzM6Nzogd2FybmluZzogdmFyaWFibGUg4oCYcmPi
gJkgc2V0IGJ1dAoJbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpUaGUgcmV0
dXJuIHZhbHVlIG9mIHJpb19hZGRfb3V0Yl9tZXNzYWdlKCkgaXMgYXNzaWduZWQgdG8gJ3JjJyBi
dXQgaXQKaXMgbmV2ZXIgdXNlZC4gRml4IHRoaXMgd2FybmluZyBieSBsb2dnaW5nIGFuIGVycm9y
IGlmICdyYycgaXMgbm9uLXplcm8uCgpTaWduZWQtb2ZmLWJ5OiBBbmlydWRoIFJheWFiaGFyYW0g
PG1haWxAYW5pcnVkaHJiLmNvbT4KLS0tCgpDaGFuZ2VzIGluIHYyOgpMb2cgYW4gZXJyb3IgaW5z
dGVhZCBvZiBqdXN0IHJlbW92aW5nICdyYycuCgp2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGttbC8yMDIxMDUwMTA1NTAxOC45MjQ0LTEtbWFpbEBhbmlydWRocmIuY29tLwoKLS0tCiBkcml2
ZXJzL3JhcGlkaW8vcmlvX2NtLmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9yYXBpZGlvL3Jpb19jbS5jIGIvZHJpdmVycy9y
YXBpZGlvL3Jpb19jbS5jCmluZGV4IDUwZWM1M2Q2N2E0Yy4uOTcxYTM2ZjFhMjNhIDEwMDY0NAot
LS0gYS9kcml2ZXJzL3JhcGlkaW8vcmlvX2NtLmMKKysrIGIvZHJpdmVycy9yYXBpZGlvL3Jpb19j
bS5jCkBAIC02NzcsNiArNjc3LDExIEBAIHN0YXRpYyB2b2lkIHJpb190eGNxX2hhbmRsZXIoc3Ry
dWN0IGNtX2RldiAqY20sIGludCBzbG90KQogCQkJY20tPnR4X2J1ZltjbS0+dHhfc2xvdF0gPSBy
ZXEtPmJ1ZmZlcjsKIAkJCXJjID0gcmlvX2FkZF9vdXRiX21lc3NhZ2UoY20tPm1wb3J0LCByZXEt
PnJkZXYsIGNtYm94LAogCQkJCQkJICByZXEtPmJ1ZmZlciwgcmVxLT5sZW4pOworCQkJaWYgKHJj
KSB7CisJCQkJcmlvY21fZXJyb3IoIkZhaWxlZCB0byBhZGQgbXNnIHRvIHR4IHF1ZXVlIChlcnI9
JWQpIiwKKwkJCQkJCXJjKTsKKwkJCX0KKwogCQkJa2ZyZWUocmVxLT5idWZmZXIpOwogCQkJa2Zy
ZWUocmVxKTsKIAotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2Vy
bmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
