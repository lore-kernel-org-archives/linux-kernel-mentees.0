Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49406C4167D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Nov 2023 17:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C90FF4EE78;
	Wed,  1 Nov 2023 17:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C90FF4EE78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F8ybLadnzVLF; Wed,  1 Nov 2023 17:54:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C8B2E4EE1E;
	Wed,  1 Nov 2023 17:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8B2E4EE1E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2B75C0072;
	Wed,  1 Nov 2023 17:54:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E290BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 17:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A754C431BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 17:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A754C431BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ItGvKcmog_Wp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 17:54:03 +0000 (UTC)
X-Greylist: delayed 105290 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 01 Nov 2023 17:54:03 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FBB9431DD
Received: from 19.mo584.mail-out.ovh.net (19.mo584.mail-out.ovh.net
 [87.98.179.66])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FBB9431DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 17:54:03 +0000 (UTC)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.108.1.15])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 10EC127EC7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 17:36:38 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-k8p4s (unknown [10.108.4.11])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3EE021FD7A;
 Wed,  1 Nov 2023 17:36:37 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.103])
 by ghost-submission-6684bf9d7b-k8p4s with ESMTPSA
 id Yc+/CaWMQmUEEgAAHOvW/w
 (envelope-from <jose.pekkarinen@foxhound.fi>); Wed, 01 Nov 2023 17:36:37 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0057af23061-cf36-4f4c-8b48-a29c5d4dfc4c,
 E3092659390FA2EDB47E70EC17E7DF57E79FF282)
 smtp.auth=jose.pekkarinen@foxhound.fi
X-OVh-ClientIp: 87.94.110.27
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: rafael@kernel.org, len.brown@intel.com, pavel@ucw.cz,
 gregkh@linuxfoundation.org, skhan@linuxfoundation.org
Subject: [PATCH] drivers core: lookup sysfs power group before removal
Date: Wed,  1 Nov 2023 19:36:27 +0200
Message-Id: <20231101173627.2658-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Ovh-Tracer-Id: 10134788012345763331
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtgedguddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepfedtleeuteeitedvtedtteeuieevudejfeffvdetfeekleehhfelleefteetjeejnecukfhppeduvdejrddtrddtrddupdekjedrleegrdduuddtrddvjedpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugihfohhunhgurghtihhonhdrohhrghdpoffvtefjohhsthepmhhoheekgedpmhhouggvpehsmhhtphhouhht
Cc: syzbot+95f2e2439b97575ec3c0@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
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

SGludGVkIGJ5IHN5emJvb3QsIHRoZXJlIGlzIGEgZmV3IGNhc2VzIHdoZXJlIHRoZSBzeXNmcyBw
b3dlciBncm91cCBtYXkKbm90IGJlIHRoZXJlLCBsaWtlIHRoZSBmYWlsdXJlIHdoaWxlIGFkZGlu
ZyBpdCwgb3IgYWRkaW5nIGl0cyBydW50aW1lCmdyb3VwLCBvciB3aGVuIHRoZSBzeXNmcyBmaXJt
d2FyZSBsb2FkZXIgZmFsbGJhY2sgZmFpbCB0byBwb3B1bGF0ZS4gSW4KdGhlIGxhc3QgY2FzZSwg
dGhlIGRldmljZV9kZWwgZnVuY3Rpb24gd2lsbCBiZSBjYWxsZWQgbGVhZGluZyB0byBhdHRlbXB0
CnRvIHJlbW92ZSB0aGUgc3lzZnMgZ3JvdXAuIFRoaXMgcGF0Y2ggd2lsbCBsb29rdXAgZm9yIGl0
IGluIGFkdmFuY2UgdG8KZ3JhbnQgdGhhdCBpdCBpcyBlZmZlY3RpdmVseSB0aGVyZSBiZWZvcmUg
Y2xlYW5pbmcgaXQgdXAuCgpSZXBvcnRlZC1ieTogc3l6Ym90Kzk1ZjJlMjQzOWI5NzU3NWVjM2Mw
QHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KClNpZ25lZC1vZmYtYnk6IEpvc8OpIFBla2thcmlu
ZW4gPGpvc2UucGVra2FyaW5lbkBmb3hob3VuZC5maT4KLS0tCiBkcml2ZXJzL2Jhc2UvcG93ZXIv
c3lzZnMuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmFzZS9wb3dlci9zeXNmcy5jIGIvZHJpdmVy
cy9iYXNlL3Bvd2VyL3N5c2ZzLmMKaW5kZXggYTE0NzRmYjY3ZGI5Li42NjAxNzI5YzQ2OTggMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvYmFzZS9wb3dlci9zeXNmcy5jCisrKyBiL2RyaXZlcnMvYmFzZS9w
b3dlci9zeXNmcy5jCkBAIC04MzQsNSArODM0LDcgQEAgdm9pZCBkcG1fc3lzZnNfcmVtb3ZlKHN0
cnVjdCBkZXZpY2UgKmRldikKIAlkZXZfcG1fcW9zX2NvbnN0cmFpbnRzX2Rlc3Ryb3koZGV2KTsK
IAlycG1fc3lzZnNfcmVtb3ZlKGRldik7CiAJc3lzZnNfdW5tZXJnZV9ncm91cCgmZGV2LT5rb2Jq
LCAmcG1fd2FrZXVwX2F0dHJfZ3JvdXApOwotCXN5c2ZzX3JlbW92ZV9ncm91cCgmZGV2LT5rb2Jq
LCAmcG1fYXR0cl9ncm91cCk7CisKKwlpZiAoa2VybmZzX2ZpbmRfYW5kX2dldCgoJmRldi0+a29i
aiktPnNkLCBwbV9hdHRyX2dyb3VwLm5hbWUpKQorCQlzeXNmc19yZW1vdmVfZ3JvdXAoJmRldi0+
a29iaiwgJnBtX2F0dHJfZ3JvdXApOwogfQotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5n
IGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJu
ZWwtbWVudGVlcwo=
