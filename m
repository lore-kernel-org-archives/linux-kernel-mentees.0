Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBDDC00140
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 Jul 2022 16:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8034D82702;
	Sun, 31 Jul 2022 16:10:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8034D82702
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=QCG+IqHT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VN0hqggsckwD; Sun, 31 Jul 2022 16:10:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6F693826FB;
	Sun, 31 Jul 2022 16:10:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F693826FB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A62AC0033;
	Sun, 31 Jul 2022 16:10:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37F01C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 Jul 2022 16:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C329A4015F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 Jul 2022 16:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C329A4015F
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=QCG+IqHT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z7JFoSM-G6Dw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 Jul 2022 16:09:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45910404B7
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45910404B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 Jul 2022 16:09:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659283776; cv=none; d=zohomail.in; s=zohoarc; 
 b=fBYjmFwCARWWi4tqpjtYoddPlEA46q4WgK+ZVld86gtIFLtXSk4cb9GHwQw9zvc+p2HVLOz6z3HSV4hMQqEapg5sVkH0EXNgzfXgONkrrUx4T9FJXKYRJJs+o/V/WBWgAH8bTF5xoVWxJM3aIuzL/zq2Ct9OfneKoO/IhPEZwXk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659283776;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=p+JGMZFOwhjpdzA/MfM1jeGfmv3RLCTVkm7iRbrSFBc=; 
 b=VhlT7zCUN6qS/5OyWREUqDA9xHj9jid+qqB4nBbeDcwRH//xXqKrPVcIRHzFSVzoCNbgqNZdijuuaXOJjhugpvwmt4C9FyQCThBMzeuv1qW70OUOnLoJ3rSUroyO6OPVWg2hfUtgO8DewAL3UA/562TocDtwUEflY1VlLMB4+UU=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659283776; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=p+JGMZFOwhjpdzA/MfM1jeGfmv3RLCTVkm7iRbrSFBc=;
 b=QCG+IqHTBXwjdGZ6SH4PHGn2+nV4YLtxp/xoOTOJ9pRCKnIia86MIRpoKx/Z+Uy+
 EvNfhi0T5ow8XmBapjFlUzGO4k6S6KIh9KNjMrOWMzgwlbO5dNwwjOvvPeGLXkslzCe
 BOmdR/GC8tPOGQeO//7Dhuwsb4ueTIVcyruKQeEY=
Received: from localhost.localdomain (43.241.144.202 [43.241.144.202]) by
 mx.zoho.in with SMTPS id 1659283774265240.75092323645038;
 Sun, 31 Jul 2022 21:39:34 +0530 (IST)
To: x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <20220731160913.632092-1-code@siddh.me>
Subject: [PATCH] x86/numa: Use cpumask_available instead of hardcoded NULL
 check
Date: Sun, 31 Jul 2022 21:39:13 +0530
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

bm9kZV90b19jcHVtYXNrX21hcCBpcyBvZiB0eXBlIGNwdW1hc2tfdmFyX3RbXS4KCldoZW4gQ09O
RklHX0NQVU1BU0tfT0ZGU1RBQ0sgaXMgc2V0LCBjcHVtYXNrX3Zhcl90IGlzIHR5cGVkZWYnZCB0
byBhCnBvaW50ZXIgZm9yIGR5bmFtaWMgYWxsb2NhdGlvbiwgZWxzZSB0byBhbiBhcnJheSBvZiBv
bmUgZWxlbWVudC4gVGhlCiJ3aWNrZWQgZ2FtZSIgY2FuIGJlIGNoZWNrZWQgb24gbGluZSA3MDAg
b2YgaW5jbHVkZS9saW51eC9jcHVtYXNrLmguCgpUaGUgbGluZXMgY2hhbmdlZCBpbiB0aGlzIGNv
bW1pdCB3ZXJlIHByb2JhYmx5IHdyaXR0ZW4gYnkgdGhlIG9yaWdpbmFsCmF1dGhvcnMgd2l0aCBD
T05GSUdfQ1BVTUFTS19PRkZTVEFDSz15IChpLmUuIGR5bmFtaWMgYWxsb2NhdGlvbikgaW4gbWlu
ZCwKY2hlY2tpbmcgaWYgdGhlIGNwdW1hc2sgd2FzIGF2YWlsYWJsZSB2aWEgYSBkaXJlY3QgTlVM
TCBjaGVjay4KCldoZW4gQ09ORklHX0NQVU1BU0tfT0ZGU1RBQ0sgaXMgbm90IHNldCwgR0NDIGdp
dmVzIHRoZSBiZWxvdyBnaXZlbiB3YXJuaW5nCndoaWxlIGNvbXBpbGluZyB0aGUga2VybmVsLgoK
Rml4IHRoYXQgYnkgdXNpbmcgY3B1bWFza19hdmFpbGFibGUoKSwgd2hpY2ggZG9lcyB0aGUgTlVM
TCBjaGVjayB3aGVuCkNPTkZJR19DUFVNQVNLX09GRlNUQUNLIGlzIHNldCwgb3RoZXJ3aXNlIHJl
dHVybnMgdHJ1ZS4gVXNlIGl0IHdoZXJldmVyCnN1Y2ggY2hlY2tzIGFyZSBtYWRlLgoKQ29uZGl0
aW9uYWwgZGVmaW5pdGlvbnMgb2YgY3B1bWFza19hdmFpbGFibGUoKSBjYW4gYmUgZm91bmQgYWxv
bmcgd2l0aAp0aGUgZGVmaW5pdGlvbiBvZiBjcHVtYXNrX3Zhcl90LiBDaGVjayB0aGUgY3B1bWFz
ay5oIHJlZmVyZW5jZSBtZW50aW9uZWQKYWJvdmUuCgpHQ0Mgd2FybmluZyBsb2c6Cj09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQoKYXJjaC94ODYvbW0vbnVtYS5jOiBJbiBmdW5jdGlvbiDigJhjcHVtYXNrX29m
X25vZGXigJk6CmFyY2gveDg2L21tL251bWEuYzo5MTY6Mzk6IHdhcm5pbmc6IHRoZSBjb21wYXJp
c29uIHdpbGwgYWx3YXlzIGV2YWx1YXRlIGFzIOKAmGZhbHNl4oCZIGZvciB0aGUgYWRkcmVzcyBv
ZiDigJhub2RlX3RvX2NwdW1hc2tfbWFw4oCZIHdpbGwgbmV2ZXIgYmUgTlVMTCBbLVdhZGRyZXNz
XQogIDkxNiB8ICAgICAgICAgaWYgKG5vZGVfdG9fY3B1bWFza19tYXBbbm9kZV0gPT0gTlVMTCkg
ewogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn4KSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIC4vaW5jbHVkZS9saW51eC9saW5rYWdlLmg6NywKICAgICAgICAgICAg
ICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9rZXJuZWwuaDoxNywKICAgICAgICAgICAgICAgICBm
cm9tIC4vYXJjaC94ODYvaW5jbHVkZS9hc20vcGVyY3B1Lmg6MjcsCiAgICAgICAgICAgICAgICAg
ZnJvbSAuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2N1cnJlbnQuaDo2LAogICAgICAgICAgICAgICAg
IGZyb20gLi9pbmNsdWRlL2xpbnV4L211dGV4Lmg6MTQsCiAgICAgICAgICAgICAgICAgZnJvbSAu
L2luY2x1ZGUvbGludXgva2VybmZzLmg6MTEsCiAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1
ZGUvbGludXgvc3lzZnMuaDoxNiwKICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51
eC9rb2JqZWN0Lmg6MjAsCiAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvb2Yu
aDoxNywKICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9pcnFkb21haW4uaDoz
NSwKICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9hY3BpLmg6MTMsCiAgICAg
ICAgICAgICAgICAgZnJvbSBhcmNoL3g4Ni9tbS9udW1hLmM6MzoKYXJjaC94ODYvbW0vbnVtYS5j
OjY3OjE1OiBub3RlOiDigJhub2RlX3RvX2NwdW1hc2tfbWFw4oCZIGRlY2xhcmVkIGhlcmUKICAg
NjcgfCBFWFBPUlRfU1lNQk9MKG5vZGVfdG9fY3B1bWFza19tYXApOwogICAgICB8ICAgICAgICAg
ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fgouL2luY2x1ZGUvbGludXgvZXhwb3J0Lmg6ODc6Mjg6
IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCYX19fRVhQT1JUX1NZTUJPTOKAmQogICA4
NyB8ICAgICAgICAgZXh0ZXJuIHR5cGVvZihzeW0pIHN5bTsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF5+fgouL2luY2x1ZGUvbGludXgvZXhwb3J0Lmg6MTQ3OjQxOiBub3RlOiBpbiBleHBh
bnNpb24gb2YgbWFjcm8g4oCYX19FWFBPUlRfU1lNQk9M4oCZCiAgMTQ3IHwgI2RlZmluZSBfRVhQ
T1JUX1NZTUJPTChzeW0sIHNlYykgICAgICAgIF9fRVhQT1JUX1NZTUJPTChzeW0sIHNlYywgIiIp
CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+
fn5+fn5+fgouL2luY2x1ZGUvbGludXgvZXhwb3J0Lmg6MTUwOjQxOiBub3RlOiBpbiBleHBhbnNp
b24gb2YgbWFjcm8g4oCYX0VYUE9SVF9TWU1CT0zigJkKICAxNTAgfCAjZGVmaW5lIEVYUE9SVF9T
WU1CT0woc3ltKSAgICAgICAgICAgICAgX0VYUE9SVF9TWU1CT0woc3ltLCAiIikKICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn4KYXJj
aC94ODYvbW0vbnVtYS5jOjY3OjE6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhFWFBP
UlRfU1lNQk9M4oCZCiAgIDY3IHwgRVhQT1JUX1NZTUJPTChub2RlX3RvX2NwdW1hc2tfbWFwKTsK
ICAgICAgfCBefn5+fn5+fn5+fn5+Cgo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KCkZpeGVzOiBjMDMyZWY2
MGQxYWEgKCJjcHVtYXNrOiBjb252ZXJ0IG5vZGVfdG9fY3B1bWFza19tYXBbXSB0byBjcHVtYXNr
X3Zhcl90IikKRml4ZXM6IGRlMmQ5NDQ1ZjE2MiAoIng4NjogVW5pZnkgbm9kZV90b19jcHVtYXNr
X21hcCBoYW5kbGluZyBiZXR3ZWVuIDMyIGFuZCA2NGJpdCIpCgpTaWduZWQtb2ZmLWJ5OiBTaWRk
aCBSYW1hbiBQYW50IDxjb2RlQHNpZGRoLm1lPgotLS0KIGFyY2gveDg2L21tL251bWEuYyB8IDQg
KystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL3g4Ni9tbS9udW1hLmMgYi9hcmNoL3g4Ni9tbS9udW1hLmMKaW5kZXgg
ZThiMDYxNTU3ODg3Li4yYWFkYjIwMTliNGYgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L21tL251bWEu
YworKysgYi9hcmNoL3g4Ni9tbS9udW1hLmMKQEAgLTg2Nyw3ICs4NjcsNyBAQCB2b2lkIGRlYnVn
X2NwdW1hc2tfc2V0X2NwdShpbnQgY3B1LCBpbnQgbm9kZSwgYm9vbCBlbmFibGUpCiAJCXJldHVy
bjsKIAl9CiAJbWFzayA9IG5vZGVfdG9fY3B1bWFza19tYXBbbm9kZV07Ci0JaWYgKCFtYXNrKSB7
CisJaWYgKCFjcHVtYXNrX2F2YWlsYWJsZShtYXNrKSkgewogCQlwcl9lcnIoIm5vZGVfdG9fY3B1
bWFza19tYXBbJWldIE5VTExcbiIsIG5vZGUpOwogCQlkdW1wX3N0YWNrKCk7CiAJCXJldHVybjsK
QEAgLTkxMyw3ICs5MTMsNyBAQCBjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1bWFza19vZl9ub2Rl
KGludCBub2RlKQogCQlkdW1wX3N0YWNrKCk7CiAJCXJldHVybiBjcHVfbm9uZV9tYXNrOwogCX0K
LQlpZiAobm9kZV90b19jcHVtYXNrX21hcFtub2RlXSA9PSBOVUxMKSB7CisJaWYgKCFjcHVtYXNr
X2F2YWlsYWJsZShub2RlX3RvX2NwdW1hc2tfbWFwW25vZGVdKSkgewogCQlwcmludGsoS0VSTl9X
QVJOSU5HCiAJCQkiY3B1bWFza19vZl9ub2RlKCVkKTogbm8gbm9kZV90b19jcHVtYXNrX21hcCFc
biIsCiAJCQlub2RlKTsKLS0gCjIuMzUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51
eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVz
Cg==
