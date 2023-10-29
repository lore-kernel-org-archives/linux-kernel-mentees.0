Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACA1C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Oct 2023 10:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EF7284C22;
	Sun, 29 Oct 2023 10:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EF7284C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cj2qm8TLaokn; Sun, 29 Oct 2023 10:16:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 346B084985;
	Sun, 29 Oct 2023 10:16:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 346B084985
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A9F7C0071;
	Sun, 29 Oct 2023 10:16:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6AECC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 10:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EAA54302D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 10:16:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EAA54302D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SJ954hF1RMJL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 10:16:32 +0000 (UTC)
X-Greylist: delayed 1799 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 29 Oct 2023 10:16:31 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7D244302B
Received: from 1.mo576.mail-out.ovh.net (1.mo576.mail-out.ovh.net
 [178.33.251.173])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7D244302B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 10:16:31 +0000 (UTC)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.146.122])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id D3EB82807B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 09:39:40 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-wchvn (unknown [10.110.171.1])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A84961FD2D;
 Sun, 29 Oct 2023 09:39:38 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.102])
 by ghost-submission-6684bf9d7b-wchvn with ESMTPSA
 id Vv44I1ooPmW0GAAAMIZvTQ
 (envelope-from <jose.pekkarinen@foxhound.fi>); Sun, 29 Oct 2023 09:39:38 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004927f133c-9d22-4865-bed1-34b055a274b6,
 2D5A9C8C3C9544CFCEEB4DEE313913C815DB1A20)
 smtp.auth=jose.pekkarinen@foxhound.fi
X-OVh-ClientIp: 87.94.110.144
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: seanjc@google.com, pbonzini@redhat.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 skhan@linuxfoundation.org
Subject: [PATCH] KVM: x86: replace do_div with div64_ul
Date: Sun, 29 Oct 2023 11:39:28 +0200
Message-Id: <20231029093928.138570-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Ovh-Tracer-Id: 2908199461897021094
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrleekgddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepfedtleeuteeitedvtedtteeuieevudejfeffvdetfeekleehhfelleefteetjeejnecukfhppeduvdejrddtrddtrddupdekjedrleegrdduuddtrddugeegpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 hpa@zytor.com, linux-kernel-mentees@lists.linuxfoundation.org
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

UmVwb3J0ZWQgYnkgY29jY2luZWxsZSwgdGhlcmUgaXMgYSBkb19kaXYgY2FsbCB0aGF0IGRvZXMK
NjQtYnktMzIgZGl2aXNpb25zIGV2ZW4gaW4gNjRiaXQgcGxhdGZvcm1zLCB0aGlzIHBhdGNoIHdp
bGwKbW92ZSBpdCB0byBkaXY2NF91bCBtYWNybyB0aGF0IHdpbGwgZGVjaWRlIHRoZSBjb3JyZWN0
CmRpdmlzaW9uIGZ1bmN0aW9uIGZvciB0aGUgcGxhdGZvcm0gdW5kZXJuZWF0aC4gVGhlIG91dHB1
dAp0aGUgd2FybmluZyBmb2xsb3dzOgoKYXJjaC94ODYva3ZtL2xhcGljLmM6MTk0ODoxLTc6IFdB
Uk5JTkc6IGRvX2RpdigpIGRvZXMgYSA2NC1ieS0zMiBkaXZpc2lvbiwgcGxlYXNlIGNvbnNpZGVy
IHVzaW5nIGRpdjY0X3VsIGluc3RlYWQuCgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVu
IDxqb3NlLnBla2thcmluZW5AZm94aG91bmQuZmk+Ci0tLQogYXJjaC94ODYva3ZtL2xhcGljLmMg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vbGFwaWMuYyBiL2FyY2gveDg2L2t2bS9sYXBpYy5jCmlu
ZGV4IDNlOTc3ZGJiZjk5My4uMGI5MGM2YWQ1MDkxIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0v
bGFwaWMuYworKysgYi9hcmNoL3g4Ni9rdm0vbGFwaWMuYwpAQCAtMTk0NSw3ICsxOTQ1LDcgQEAg
c3RhdGljIHZvaWQgc3RhcnRfc3dfdHNjZGVhZGxpbmUoc3RydWN0IGt2bV9sYXBpYyAqYXBpYykK
IAlndWVzdF90c2MgPSBrdm1fcmVhZF9sMV90c2ModmNwdSwgcmR0c2MoKSk7CiAKIAlucyA9ICh0
c2NkZWFkbGluZSAtIGd1ZXN0X3RzYykgKiAxMDAwMDAwVUxMOwotCWRvX2RpdihucywgdGhpc190
c2Nfa2h6KTsKKwlkaXY2NF91bChucywgdGhpc190c2Nfa2h6KTsKIAogCWlmIChsaWtlbHkodHNj
ZGVhZGxpbmUgPiBndWVzdF90c2MpICYmCiAJICAgIGxpa2VseShucyA+IGFwaWMtPmxhcGljX3Rp
bWVyLnRpbWVyX2FkdmFuY2VfbnMpKSB7Ci0tIAoyLjM5LjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcg
bGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5l
bC1tZW50ZWVzCg==
