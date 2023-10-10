Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535F8CD8CAC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Oct 2023 18:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6E5860F27;
	Tue, 10 Oct 2023 18:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6E5860F27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VtgokI7N0Jkt; Tue, 10 Oct 2023 18:04:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9616F60761;
	Tue, 10 Oct 2023 18:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9616F60761
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C1B5C0071;
	Tue, 10 Oct 2023 18:04:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E177CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 18:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9B9560F27
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 18:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9B9560F27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0_uW9hzKOHBW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 18:04:43 +0000 (UTC)
X-Greylist: delayed 28488 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 10 Oct 2023 18:04:43 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77CB660761
Received: from 8.mo581.mail-out.ovh.net (8.mo581.mail-out.ovh.net
 [46.105.77.114])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77CB660761
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 18:04:43 +0000 (UTC)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.143.24])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id AC31228189
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 17:48:28 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-stm2z (unknown [10.110.115.58])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 6CCDA1FD7A;
 Tue, 10 Oct 2023 17:48:27 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.96])
 by ghost-submission-6684bf9d7b-stm2z with ESMTPSA
 id 8psZFmuOJWW+IgUAE6teJg
 (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 10 Oct 2023 17:48:27 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0014c201574-7c4e-4efe-b59f-e4ee1977f006,
 0BECE3FDD040DFF140D1580490AC4D25886584D9)
 smtp.auth=jose.pekkarinen@foxhound.fi
X-OVh-ClientIp: 91.157.111.220
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: seanjc@google.com,
	pbonzini@redhat.com,
	skhan@linuxfoundation.org
Subject: [PATCH] kvm/sev: remove redundant MISC_CG_RES_SEV_ES
Date: Tue, 10 Oct 2023 20:49:13 +0300
Message-ID: <20231010174932.29769-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 10262577655121553062
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrheehgdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeeftdelueetieetvdettdetueeivedujeefffdvteefkeelhefhleelfeetteejjeenucfkphepuddvjedrtddrtddruddpledurdduheejrdduuddurddvvddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugihfohhunhgurghtihhonhdrohhrghdpoffvtefjohhsthepmhhoheekuddpmhhouggvpehsmhhtphhouhht
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

U0VWLUVTIGlzIGFuIGV4dHJhIGVuY3J5cHRlZCBzdGF0ZSB0aGF0IHNoYXJlcyBjb21tb24gcmVz
b3VyY2VzCndpdGggU0VWLiBVc2luZyBhbiBleHRyYSBDRyBmb3IgaXRzIHB1cnBvc2UgZG9lc24n
dCBzZWVtIHRvCnByb3ZpZGUgbXVjaCB2YWx1ZS4gVGhpcyBwYXRjaCB3aWxsIGNsZWFuIHVwIHRo
ZSBjb250cm9sIGdyb3VwCmFsb25nIHdpdGggbXVsdGlwbGUgY2hlY2tzIHRoYXQgYmVjb21lIHJl
ZHVuZGFudCB3aXRoIGl0LgoKVGhlIHBhdGNoIHdpbGwgYWxzbyByZW1vdmUgYSByZWR1bmRhbnQg
bG9naWMgb24gc2V2IGluaXRpYWxpemF0aW9uCnRoYXQgcHJvZHVjZXMgU0VWLUVTIHRvIGJlIGRp
c2FibGVkLCB3aGlsZSBzdXBwb3J0ZWQgYnkgdGhlIGNwdQphbmQgcmVxdWVzdGVkIGJ5IHRoZSB1
c2VyIHRocm91Z2ggdGhlIHNldl9lcyBwYXJhbWV0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBQ
ZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AZm94aG91bmQuZmk+Ci0tLQogYXJjaC94ODYva3Zt
L3N2bS9zZXYuYyAgICAgIHwgMTggKysrLS0tLS0tLS0tLS0tLS0tCiBpbmNsdWRlL2xpbnV4L21p
c2NfY2dyb3VwLmggfCAgMiAtLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDE3
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9zdm0vc2V2LmMgYi9hcmNo
L3g4Ni9rdm0vc3ZtL3Nldi5jCmluZGV4IDA3NzU2YjczNDhhZS4uOGEwNmQ5MjE4N2NmIDEwMDY0
NAotLS0gYS9hcmNoL3g4Ni9rdm0vc3ZtL3Nldi5jCisrKyBiL2FyY2gveDg2L2t2bS9zdm0vc2V2
LmMKQEAgLTM3LDEzICszNyw5IEBACiAgKiB0aGlzIGZpbGUgYXJlIG5vdCB1c2VkIGJ1dCB0aGlz
IGZpbGUgc3RpbGwgZ2V0cyBjb21waWxlZCBpbnRvIHRoZSBLVk0gQU1ECiAgKiBtb2R1bGUuCiAg
KgotICogV2Ugd2lsbCBub3QgaGF2ZSBNSVNDX0NHX1JFU19TRVYgYW5kIE1JU0NfQ0dfUkVTX1NF
Vl9FUyBlbnRyaWVzIGluIHRoZSBlbnVtCi0gKiBtaXNjX3Jlc190eXBlIHt9IGRlZmluZWQgaW4g
bGludXgvbWlzY19jZ3JvdXAuaC4KLSAqCiAgKiBCZWxvdyBtYWNyb3MgYWxsb3cgY29tcGlsYXRp
b24gdG8gc3VjY2VlZC4KICAqLwogI2RlZmluZSBNSVNDX0NHX1JFU19TRVYgTUlTQ19DR19SRVNf
VFlQRVMKLSNkZWZpbmUgTUlTQ19DR19SRVNfU0VWX0VTIE1JU0NfQ0dfUkVTX1RZUEVTCiAjZW5k
aWYKIAogI2lmZGVmIENPTkZJR19LVk1fQU1EX1NFVgpAQCAtMTI1LDEzICsxMjEsMTMgQEAgc3Rh
dGljIGJvb2wgX19zZXZfcmVjeWNsZV9hc2lkcyhpbnQgbWluX2FzaWQsIGludCBtYXhfYXNpZCkK
IAogc3RhdGljIGludCBzZXZfbWlzY19jZ190cnlfY2hhcmdlKHN0cnVjdCBrdm1fc2V2X2luZm8g
KnNldikKIHsKLQllbnVtIG1pc2NfcmVzX3R5cGUgdHlwZSA9IHNldi0+ZXNfYWN0aXZlID8gTUlT
Q19DR19SRVNfU0VWX0VTIDogTUlTQ19DR19SRVNfU0VWOworCWVudW0gbWlzY19yZXNfdHlwZSB0
eXBlID0gTUlTQ19DR19SRVNfU0VWOwogCXJldHVybiBtaXNjX2NnX3RyeV9jaGFyZ2UodHlwZSwg
c2V2LT5taXNjX2NnLCAxKTsKIH0KIAogc3RhdGljIHZvaWQgc2V2X21pc2NfY2dfdW5jaGFyZ2Uo
c3RydWN0IGt2bV9zZXZfaW5mbyAqc2V2KQogewotCWVudW0gbWlzY19yZXNfdHlwZSB0eXBlID0g
c2V2LT5lc19hY3RpdmUgPyBNSVNDX0NHX1JFU19TRVZfRVMgOiBNSVNDX0NHX1JFU19TRVY7CisJ
ZW51bSBtaXNjX3Jlc190eXBlIHR5cGUgPSBNSVNDX0NHX1JFU19TRVY7CiAJbWlzY19jZ191bmNo
YXJnZSh0eXBlLCBzZXYtPm1pc2NfY2csIDEpOwogfQogCkBAIC0yMTY3LDcgKzIxNjMsNyBAQCB2
b2lkIF9faW5pdCBzZXZfc2V0X2NwdV9jYXBzKHZvaWQpCiB2b2lkIF9faW5pdCBzZXZfaGFyZHdh
cmVfc2V0dXAodm9pZCkKIHsKICNpZmRlZiBDT05GSUdfS1ZNX0FNRF9TRVYKLQl1bnNpZ25lZCBp
bnQgZWF4LCBlYngsIGVjeCwgZWR4LCBzZXZfYXNpZF9jb3VudCwgc2V2X2VzX2FzaWRfY291bnQ7
CisJdW5zaWduZWQgaW50IGVheCwgZWJ4LCBlY3gsIGVkeCwgc2V2X2FzaWRfY291bnQ7CiAJYm9v
bCBzZXZfZXNfc3VwcG9ydGVkID0gZmFsc2U7CiAJYm9vbCBzZXZfc3VwcG9ydGVkID0gZmFsc2U7
CiAKQEAgLTIyMzYsMTQgKzIyMzIsNyBAQCB2b2lkIF9faW5pdCBzZXZfaGFyZHdhcmVfc2V0dXAo
dm9pZCkKIAlpZiAoIWJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9TRVZfRVMpKQogCQlnb3RvIG91
dDsKIAotCS8qIEhhcyB0aGUgc3lzdGVtIGJlZW4gYWxsb2NhdGVkIEFTSURzIGZvciBTRVYtRVM/
ICovCi0JaWYgKG1pbl9zZXZfYXNpZCA9PSAxKQotCQlnb3RvIG91dDsKLQotCXNldl9lc19hc2lk
X2NvdW50ID0gbWluX3Nldl9hc2lkIC0gMTsKLQlXQVJOX09OX09OQ0UobWlzY19jZ19zZXRfY2Fw
YWNpdHkoTUlTQ19DR19SRVNfU0VWX0VTLCBzZXZfZXNfYXNpZF9jb3VudCkpOwogCXNldl9lc19z
dXBwb3J0ZWQgPSB0cnVlOwotCiBvdXQ6CiAJaWYgKGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9T
RVYpKQogCQlwcl9pbmZvKCJTRVYgJXMgKEFTSURzICV1IC0gJXUpXG4iLApAQCAtMjI3MSw3ICsy
MjYwLDYgQEAgdm9pZCBzZXZfaGFyZHdhcmVfdW5zZXR1cCh2b2lkKQogCWJpdG1hcF9mcmVlKHNl
dl9yZWNsYWltX2FzaWRfYml0bWFwKTsKIAogCW1pc2NfY2dfc2V0X2NhcGFjaXR5KE1JU0NfQ0df
UkVTX1NFViwgMCk7Ci0JbWlzY19jZ19zZXRfY2FwYWNpdHkoTUlTQ19DR19SRVNfU0VWX0VTLCAw
KTsKIH0KIAogaW50IHNldl9jcHVfaW5pdChzdHJ1Y3Qgc3ZtX2NwdV9kYXRhICpzZCkKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvbWlzY19jZ3JvdXAuaCBiL2luY2x1ZGUvbGludXgvbWlzY19j
Z3JvdXAuaAppbmRleCBjMjM4MjA3ZDE2MTUuLjIzZDNjZDE1M2Y2MCAxMDA2NDQKLS0tIGEvaW5j
bHVkZS9saW51eC9taXNjX2Nncm91cC5oCisrKyBiL2luY2x1ZGUvbGludXgvbWlzY19jZ3JvdXAu
aApAQCAtMTUsOCArMTUsNiBAQCBlbnVtIG1pc2NfcmVzX3R5cGUgewogI2lmZGVmIENPTkZJR19L
Vk1fQU1EX1NFVgogCS8qIEFNRCBTRVYgQVNJRHMgcmVzb3VyY2UgKi8KIAlNSVNDX0NHX1JFU19T
RVYsCi0JLyogQU1EIFNFVi1FUyBBU0lEcyByZXNvdXJjZSAqLwotCU1JU0NfQ0dfUkVTX1NFVl9F
UywKICNlbmRpZgogCU1JU0NfQ0dfUkVTX1RZUEVTCiB9OwotLSAKMi40MS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVl
cyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1rZXJuZWwtbWVudGVlcwo=
