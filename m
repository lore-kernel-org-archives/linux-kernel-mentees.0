Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6CBCD691F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Oct 2023 10:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F7B48141E;
	Tue, 10 Oct 2023 10:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F7B48141E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KW1jeejkZP_B; Tue, 10 Oct 2023 10:19:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 34B5281291;
	Tue, 10 Oct 2023 10:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34B5281291
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D4FEC0039;
	Tue, 10 Oct 2023 10:19:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B13AC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 10:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16136401F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 10:19:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16136401F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oWjfQlvbZfZJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 10:19:53 +0000 (UTC)
X-Greylist: delayed 999 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 10 Oct 2023 10:19:53 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A202401E2
Received: from 9.mo581.mail-out.ovh.net (9.mo581.mail-out.ovh.net
 [46.105.60.248])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A202401E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 10:19:53 +0000 (UTC)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.156.77])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 7A7322854C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 10:03:11 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-dnnmd (unknown [10.110.208.237])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id CCBC51FE50;
 Tue, 10 Oct 2023 10:03:08 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.105])
 by ghost-submission-6684bf9d7b-dnnmd with ESMTPSA
 id iJQ8KlwhJWUQWgAArvdK0g
 (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 10 Oct 2023 10:03:08 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0061679898a-46f3-4f1d-875a-19332c22c92d,
 0BECE3FDD040DFF140D1580490AC4D25886584D9)
 smtp.auth=jose.pekkarinen@foxhound.fi
X-OVh-ClientIp: 91.157.111.220
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: seanjc@google.com,
	pbonzini@redhat.com,
	skhan@linuxfoundation.org
Subject: [PATCH] kvm/sev: make SEV/SEV-ES asids configurable
Date: Tue, 10 Oct 2023 13:04:39 +0300
Message-ID: <20231010100441.30950-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 2404640727859308198
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrheehgddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepfedtleeuteeitedvtedtteeuieevudejfeffvdetfeekleehhfelleefteetjeejnecukfhppeduvdejrddtrddtrddupdeluddrudehjedrudduuddrvddvtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugihfohhunhgurghtihhonhdrohhrghdpoffvtefjohhsthepmhhoheekuddpmhhouggvpehsmhhtphhouhht
Cc: dave.hansen@linux.intel.com, kvm@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 tglx@linutronix.de, linux-kernel-mentees@lists.linuxfoundation.org
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

VGhlcmUgYXJlIGJpb3NlcyB0aGF0IGRvZXNuJ3QgYWxsb3cgdG8gY29uZmlndXJlIHRoZQpudW1i
ZXIgb2YgYXNpZHMgYWxsb2NhdGVkIGZvciBTRVYvU0VWLUVTLCBmb3IgdGhvc2UKY2FzZXMsIHRo
ZSBkZWZhdWx0IGJlaGF2aW91ciBhbGxvY2F0ZXMgYWxsIHRoZSBhc2lkcwpmb3IgU0VWLCBsZWF2
aW5nIG5vIHJvb20gZm9yIFNFVi1FUyB0byBoYXZlIHNvbWUgZnVuLgpJZiB0aGUgdXNlciByZXF1
ZXN0IFNFVi1FUyB0byBiZSBlbmFibGVkLCBpdCB3aWxsCmZpbmQgdGhlIGtlcm5lbCBqdXN0IHJ1
biBvdXQgb2YgcmVzb3VyY2VzIGFuZCBpZ25vcmVkCnVzZXIgcmVxdWVzdC4gVGhpcyBmb2xsb3dp
bmcgcGF0Y2ggd2lsbCBhZGRyZXNzIHRoaXMKaXNzdWUgYnkgbWFraW5nIHRoZSBudW1iZXIgb2Yg
YXNpZHMgZm9yIFNFVi9TRVYtRVMKY29uZmlndXJhYmxlIG92ZXIga2VybmVsIG1vZHVsZSBwYXJh
bWV0ZXJzLgoKU2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVu
QGZveGhvdW5kLmZpPgotLS0KIGFyY2gveDg2L2t2bS9zdm0vc2V2LmMgfCAyOCArKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vc3ZtL3Nldi5jIGIvYXJjaC94
ODYva3ZtL3N2bS9zZXYuYwppbmRleCAwNzc1NmI3MzQ4YWUuLjY4YTYzYjQyZDE2YSAxMDA2NDQK
LS0tIGEvYXJjaC94ODYva3ZtL3N2bS9zZXYuYworKysgYi9hcmNoL3g4Ni9rdm0vc3ZtL3Nldi5j
CkBAIC01MSw5ICs1MSwxOCBAQAogc3RhdGljIGJvb2wgc2V2X2VuYWJsZWQgPSB0cnVlOwogbW9k
dWxlX3BhcmFtX25hbWVkKHNldiwgc2V2X2VuYWJsZWQsIGJvb2wsIDA0NDQpOwogCisvKiBuciBv
ZiBhc2lkcyByZXF1ZXN0ZWQgZm9yIFNFViAqLworc3RhdGljIHVuc2lnbmVkIGludCByZXF1ZXN0
ZWRfc2V2X2FzaWRzOworbW9kdWxlX3BhcmFtX25hbWVkKHNldl9hc2lkcywgcmVxdWVzdGVkX3Nl
dl9hc2lkcywgdWludCwgMDQ0NCk7CisKIC8qIGVuYWJsZS9kaXNhYmxlIFNFVi1FUyBzdXBwb3J0
ICovCiBzdGF0aWMgYm9vbCBzZXZfZXNfZW5hYmxlZCA9IHRydWU7CiBtb2R1bGVfcGFyYW1fbmFt
ZWQoc2V2X2VzLCBzZXZfZXNfZW5hYmxlZCwgYm9vbCwgMDQ0NCk7CisKKy8qIG5yIG9mIGFzaWRz
IHJlcXVlc3RlZCBmb3IgU0VWLUVTICovCitzdGF0aWMgdW5zaWduZWQgaW50IHJlcXVlc3RlZF9z
ZXZfZXNfYXNpZHM7Cittb2R1bGVfcGFyYW1fbmFtZWQoc2V2X2VzX2FzaWRzLCByZXF1ZXN0ZWRf
c2V2X2FzaWRzLCB1aW50LCAwNDQ0KTsKKwogI2Vsc2UKICNkZWZpbmUgc2V2X2VuYWJsZWQgZmFs
c2UKICNkZWZpbmUgc2V2X2VzX2VuYWJsZWQgZmFsc2UKQEAgLTIxOTQsNiArMjIwMywxMSBAQCB2
b2lkIF9faW5pdCBzZXZfaGFyZHdhcmVfc2V0dXAodm9pZCkKIAlpZiAoIW1heF9zZXZfYXNpZCkK
IAkJZ290byBvdXQ7CiAKKwlpZiAocmVxdWVzdGVkX3Nldl9hc2lkcyArIHJlcXVlc3RlZF9zZXZf
ZXNfYXNpZHMgPiBtYXhfc2V2X2FzaWQpIHsKKwkJcHJfaW5mbygiU0VWIGFzaWRzIHJlcXVlc3Rl
ZCBtb3JlIHRoYW4gYXZhaWxhYmxlOiAldSBBU0lEc1xuIiwgbWF4X3Nldl9hc2lkKTsKKwkJZ290
byBvdXQ7CisJfQorCiAJLyogTWluaW11bSBBU0lEIHZhbHVlIHRoYXQgc2hvdWxkIGJlIHVzZWQg
Zm9yIFNFViBndWVzdCAqLwogCW1pbl9zZXZfYXNpZCA9IGVkeDsKIAlzZXZfbWVfbWFzayA9IDFV
TCA8PCAoZWJ4ICYgMHgzZik7CkBAIC0yMjE1LDcgKzIyMjksOCBAQCB2b2lkIF9faW5pdCBzZXZf
aGFyZHdhcmVfc2V0dXAodm9pZCkKIAkJZ290byBvdXQ7CiAJfQogCi0Jc2V2X2FzaWRfY291bnQg
PSBtYXhfc2V2X2FzaWQgLSBtaW5fc2V2X2FzaWQgKyAxOworCXNldl9hc2lkX2NvdW50ID0gKHJl
cXVlc3RlZF9zZXZfYXNpZHMpID8gbWF4X3Nldl9hc2lkIC0gbWluX3Nldl9hc2lkICsgMSA6CisJ
CQkJCQkgcmVxdWVzdGVkX3Nldl9hc2lkczsKIAlXQVJOX09OX09OQ0UobWlzY19jZ19zZXRfY2Fw
YWNpdHkoTUlTQ19DR19SRVNfU0VWLCBzZXZfYXNpZF9jb3VudCkpOwogCXNldl9zdXBwb3J0ZWQg
PSB0cnVlOwogCkBAIC0yMjM3LDEwICsyMjUyLDExIEBAIHZvaWQgX19pbml0IHNldl9oYXJkd2Fy
ZV9zZXR1cCh2b2lkKQogCQlnb3RvIG91dDsKIAogCS8qIEhhcyB0aGUgc3lzdGVtIGJlZW4gYWxs
b2NhdGVkIEFTSURzIGZvciBTRVYtRVM/ICovCi0JaWYgKG1pbl9zZXZfYXNpZCA9PSAxKQorCWlm
IChtYXhfc2V2X2FzaWQgLSBzZXZfYXNpZF9jb3VudCA8PSAxKQogCQlnb3RvIG91dDsKIAotCXNl
dl9lc19hc2lkX2NvdW50ID0gbWluX3Nldl9hc2lkIC0gMTsKKwlzZXZfZXNfYXNpZF9jb3VudCA9
IChyZXF1ZXN0ZWRfc2V2X2VzX2FzaWRzKSA/IG1pbl9zZXZfYXNpZCAtIDEgOgorCQkJCQkJICAg
ICAgIHJlcXVlc3RlZF9zZXZfZXNfYXNpZHM7CiAJV0FSTl9PTl9PTkNFKG1pc2NfY2dfc2V0X2Nh
cGFjaXR5KE1JU0NfQ0dfUkVTX1NFVl9FUywgc2V2X2VzX2FzaWRfY291bnQpKTsKIAlzZXZfZXNf
c3VwcG9ydGVkID0gdHJ1ZTsKIApAQCAtMjI0OCwxMSArMjI2NCwxMyBAQCB2b2lkIF9faW5pdCBz
ZXZfaGFyZHdhcmVfc2V0dXAodm9pZCkKIAlpZiAoYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX1NF
VikpCiAJCXByX2luZm8oIlNFViAlcyAoQVNJRHMgJXUgLSAldSlcbiIsCiAJCQlzZXZfc3VwcG9y
dGVkID8gImVuYWJsZWQiIDogImRpc2FibGVkIiwKLQkJCW1pbl9zZXZfYXNpZCwgbWF4X3Nldl9h
c2lkKTsKKwkJCW1pbl9zZXZfYXNpZCwgc2V2X2FzaWRfY291bnQpOwogCWlmIChib290X2NwdV9o
YXMoWDg2X0ZFQVRVUkVfU0VWX0VTKSkKIAkJcHJfaW5mbygiU0VWLUVTICVzIChBU0lEcyAldSAt
ICV1KVxuIiwKIAkJCXNldl9lc19zdXBwb3J0ZWQgPyAiZW5hYmxlZCIgOiAiZGlzYWJsZWQiLAot
CQkJbWluX3Nldl9hc2lkID4gMSA/IDEgOiAwLCBtaW5fc2V2X2FzaWQgLSAxKTsKKwkJCXNldl9h
c2lkX2NvdW50LAorCQkJKHJlcXVlc3RlZF9zZXZfZXNfYXNpZHMpID8gMCA6CisJCQkJCQkgICBz
ZXZfYXNpZF9jb3VudCArIHNldl9lc19hc2lkX2NvdW50KTsKIAogCXNldl9lbmFibGVkID0gc2V2
X3N1cHBvcnRlZDsKIAlzZXZfZXNfZW5hYmxlZCA9IHNldl9lc19zdXBwb3J0ZWQ7Ci0tIAoyLjQx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
