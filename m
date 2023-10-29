Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCA9C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Oct 2023 13:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BBAA84E81;
	Sun, 29 Oct 2023 13:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BBAA84E81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CjkddCiplNF9; Sun, 29 Oct 2023 13:19:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2179C84E80;
	Sun, 29 Oct 2023 13:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2179C84E80
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DCD33C0039;
	Sun, 29 Oct 2023 13:19:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5A88C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 13:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA95A42EE3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 13:19:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA95A42EE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C3xOXLuJ54j3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 13:19:01 +0000 (UTC)
X-Greylist: delayed 4199 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 29 Oct 2023 13:19:00 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8A55405F5
Received: from 16.mo584.mail-out.ovh.net (16.mo584.mail-out.ovh.net
 [188.165.55.104])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8A55405F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 13:19:00 +0000 (UTC)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.109.146.240])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id A814B23C03
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 09:39:10 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-cv5d2 (unknown [10.110.171.164])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 856C91FE5E;
 Sun, 29 Oct 2023 09:39:08 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.103])
 by ghost-submission-6684bf9d7b-cv5d2 with ESMTPSA
 id JR/PGjwoPmW5FQAA0ek+iw
 (envelope-from <jose.pekkarinen@foxhound.fi>); Sun, 29 Oct 2023 09:39:08 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005964038db-79ba-4581-8d75-77bb2bfe47b4,
 2D5A9C8C3C9544CFCEEB4DEE313913C815DB1A20)
 smtp.auth=jose.pekkarinen@foxhound.fi
X-OVh-ClientIp: 87.94.110.144
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: seanjc@google.com, pbonzini@redhat.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 skhan@linuxfoundation.org
Subject: [PATCH] KVM: x86: cleanup unused variables
Date: Sun, 29 Oct 2023 11:38:59 +0200
Message-Id: <20231029093859.138442-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Ovh-Tracer-Id: 2899755212625716902
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrleekgddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepfedtleeuteeitedvtedtteeuieevudejfeffvdetfeekleehhfelleefteetjeejnecukfhppeduvdejrddtrddtrddupdekjedrleegrdduuddtrddugeegpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth
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

UmVwb3J0ZWQgYnkgY29jY2luZWxsZSwgdGhlIGZvbGxvd2luZyBwYXRjaCB3aWxsIHJlbW92ZSBz
b21lCnJlZHVuZGFudCB2YXJpYWJsZXMuIFRoaXMgcGF0Y2ggd2lsbCBhZGRyZXNzIHRoZSBmb2xs
b3dpbmcKd2FybmluZ3M6CgphcmNoL3g4Ni9rdm0vZW11bGF0ZS5jOjEzMTU6NS03OiBVbm5lZWRl
ZCB2YXJpYWJsZTogInJjIi4gUmV0dXJuICJYODZFTVVMX0NPTlRJTlVFIiBvbiBsaW5lIDEzMzAK
YXJjaC94ODYva3ZtL2VtdWxhdGUuYzo0NTU3OjUtNzogVW5uZWVkZWQgdmFyaWFibGU6ICJyYyIu
IFJldHVybiAiWDg2RU1VTF9DT05USU5VRSIgb24gbGluZSA0NTkxCmFyY2gveDg2L2t2bS9lbXVs
YXRlLmM6MTE4MDo1LTc6IFVubmVlZGVkIHZhcmlhYmxlOiAicmMiLiBSZXR1cm4gIlg4NkVNVUxf
Q09OVElOVUUiIG9uIGxpbmUgMTIwMgoKU2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2FyaW5lbiA8
am9zZS5wZWtrYXJpbmVuQGZveGhvdW5kLmZpPgotLS0KIGFyY2gveDg2L2t2bS9lbXVsYXRlLmMg
fCAxNyArKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL2VtdWxhdGUuYyBiL2Fy
Y2gveDg2L2t2bS9lbXVsYXRlLmMKaW5kZXggMjY3M2NkNWM0NmNiLi5jNGJiMDNhODhkZmUgMTAw
NjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9lbXVsYXRlLmMKKysrIGIvYXJjaC94ODYva3ZtL2VtdWxh
dGUuYwpAQCAtMTE3Nyw3ICsxMTc3LDYgQEAgc3RhdGljIGludCBkZWNvZGVfbW9kcm0oc3RydWN0
IHg4Nl9lbXVsYXRlX2N0eHQgKmN0eHQsCiB7CiAJdTggc2liOwogCWludCBpbmRleF9yZWcsIGJh
c2VfcmVnLCBzY2FsZTsKLQlpbnQgcmMgPSBYODZFTVVMX0NPTlRJTlVFOwogCXVsb25nIG1vZHJt
X2VhID0gMDsKIAogCWN0eHQtPm1vZHJtX3JlZyA9ICgoY3R4dC0+cmV4X3ByZWZpeCA8PCAxKSAm
IDgpOyAvKiBSRVguUiAqLwpAQCAtMTE5OSwxNiArMTE5OCwxNiBAQCBzdGF0aWMgaW50IGRlY29k
ZV9tb2RybShzdHJ1Y3QgeDg2X2VtdWxhdGVfY3R4dCAqY3R4dCwKIAkJCW9wLT5ieXRlcyA9IDE2
OwogCQkJb3AtPmFkZHIueG1tID0gY3R4dC0+bW9kcm1fcm07CiAJCQlrdm1fcmVhZF9zc2VfcmVn
KGN0eHQtPm1vZHJtX3JtLCAmb3AtPnZlY192YWwpOwotCQkJcmV0dXJuIHJjOworCQkJcmV0dXJu
IFg4NkVNVUxfQ09OVElOVUU7CiAJCX0KIAkJaWYgKGN0eHQtPmQgJiBNbXgpIHsKIAkJCW9wLT50
eXBlID0gT1BfTU07CiAJCQlvcC0+Ynl0ZXMgPSA4OwogCQkJb3AtPmFkZHIubW0gPSBjdHh0LT5t
b2RybV9ybSAmIDc7Ci0JCQlyZXR1cm4gcmM7CisJCQlyZXR1cm4gWDg2RU1VTF9DT05USU5VRTsK
IAkJfQogCQlmZXRjaF9yZWdpc3Rlcl9vcGVyYW5kKG9wKTsKLQkJcmV0dXJuIHJjOworCQlyZXR1
cm4gWDg2RU1VTF9DT05USU5VRTsKIAl9CiAKIAlvcC0+dHlwZSA9IE9QX01FTTsKQEAgLTEzMDYs
MTQgKzEzMDUsMTIgQEAgc3RhdGljIGludCBkZWNvZGVfbW9kcm0oc3RydWN0IHg4Nl9lbXVsYXRl
X2N0eHQgKmN0eHQsCiAJCWN0eHQtPm1lbW9wLmFkZHIubWVtLmVhID0gKHUzMiljdHh0LT5tZW1v
cC5hZGRyLm1lbS5lYTsKIAogZG9uZToKLQlyZXR1cm4gcmM7CisJcmV0dXJuIFg4NkVNVUxfQ09O
VElOVUU7CiB9CiAKIHN0YXRpYyBpbnQgZGVjb2RlX2FicyhzdHJ1Y3QgeDg2X2VtdWxhdGVfY3R4
dCAqY3R4dCwKIAkJICAgICAgc3RydWN0IG9wZXJhbmQgKm9wKQogewotCWludCByYyA9IFg4NkVN
VUxfQ09OVElOVUU7Ci0KIAlvcC0+dHlwZSA9IE9QX01FTTsKIAlzd2l0Y2ggKGN0eHQtPmFkX2J5
dGVzKSB7CiAJY2FzZSAyOgpAQCAtMTMyNyw3ICsxMzI0LDcgQEAgc3RhdGljIGludCBkZWNvZGVf
YWJzKHN0cnVjdCB4ODZfZW11bGF0ZV9jdHh0ICpjdHh0LAogCQlicmVhazsKIAl9CiBkb25lOgot
CXJldHVybiByYzsKKwlyZXR1cm4gWDg2RU1VTF9DT05USU5VRTsKIH0KIAogc3RhdGljIHZvaWQg
ZmV0Y2hfYml0X29wZXJhbmQoc3RydWN0IHg4Nl9lbXVsYXRlX2N0eHQgKmN0eHQpCkBAIC00NTU0
LDggKzQ1NTEsNiBAQCBzdGF0aWMgdW5zaWduZWQgaW1tX3NpemUoc3RydWN0IHg4Nl9lbXVsYXRl
X2N0eHQgKmN0eHQpCiBzdGF0aWMgaW50IGRlY29kZV9pbW0oc3RydWN0IHg4Nl9lbXVsYXRlX2N0
eHQgKmN0eHQsIHN0cnVjdCBvcGVyYW5kICpvcCwKIAkJICAgICAgdW5zaWduZWQgc2l6ZSwgYm9v
bCBzaWduX2V4dGVuc2lvbikKIHsKLQlpbnQgcmMgPSBYODZFTVVMX0NPTlRJTlVFOwotCiAJb3At
PnR5cGUgPSBPUF9JTU07CiAJb3AtPmJ5dGVzID0gc2l6ZTsKIAlvcC0+YWRkci5tZW0uZWEgPSBj
dHh0LT5fZWlwOwpAQCAtNDU4OCw3ICs0NTgzLDcgQEAgc3RhdGljIGludCBkZWNvZGVfaW1tKHN0
cnVjdCB4ODZfZW11bGF0ZV9jdHh0ICpjdHh0LCBzdHJ1Y3Qgb3BlcmFuZCAqb3AsCiAJCX0KIAl9
CiBkb25lOgotCXJldHVybiByYzsKKwlyZXR1cm4gWDg2RU1VTF9DT05USU5VRTsKIH0KIAogc3Rh
dGljIGludCBkZWNvZGVfb3BlcmFuZChzdHJ1Y3QgeDg2X2VtdWxhdGVfY3R4dCAqY3R4dCwgc3Ry
dWN0IG9wZXJhbmQgKm9wLAotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGlu
dXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVl
cwo=
