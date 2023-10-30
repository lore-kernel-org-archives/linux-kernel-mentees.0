Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373A0C4167D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Oct 2023 17:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF2A740359;
	Mon, 30 Oct 2023 17:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF2A740359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id enz4N65dQ_D2; Mon, 30 Oct 2023 17:23:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7CE1740280;
	Mon, 30 Oct 2023 17:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CE1740280
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53347C0071;
	Mon, 30 Oct 2023 17:23:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74884C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 17:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 576D641898
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 17:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 576D641898
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A6EcssR6kP1o
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 17:23:32 +0000 (UTC)
Received: from 7.mo575.mail-out.ovh.net (7.mo575.mail-out.ovh.net
 [46.105.63.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B0E44185E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 17:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B0E44185E
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.1.232])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 2EC5B25832
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 17:04:19 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-8lz29 (unknown [10.110.208.116])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 251FB1FE97;
 Mon, 30 Oct 2023 17:04:17 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.96])
 by ghost-submission-6684bf9d7b-8lz29 with ESMTPSA
 id RZwnBBHiP2V6OgEAAPa04A
 (envelope-from <jose.pekkarinen@foxhound.fi>); Mon, 30 Oct 2023 17:04:17 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00186d51cb2-c412-49ff-90f4-f1f0c70eb1d6,
 1521F8BC68C4446D6F30831D87711B1BDC7B9471)
 smtp.auth=jose.pekkarinen@foxhound.fi
X-OVh-ClientIp: 91.157.109.247
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 skhan@linuxfoundation.org
Subject: [PATCH] drm/amd/display: remove redundant check
Date: Mon, 30 Oct 2023 19:04:07 +0200
Message-Id: <20231030170407.28408-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Ovh-Tracer-Id: 16290364279173064358
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddttddgleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeeftdelueetieetvdettdetueeivedujeefffdvteefkeelhefhleelfeetteejjeenucfkphepuddvjedrtddrtddruddpledurdduheejrddutdelrddvgeejpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugihfohhunhgurghtihhonhdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht
Cc: dillon.varone@amd.com, linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, samson.tam@amd.com, SyedSaaem.Rizvi@amd.com,
 aurabindo.pillai@amd.com, stable@vger.kernel.org, daniel@ffwll.ch,
 george.shen@amd.com, alexander.deucher@amd.com, Jun.Lei@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
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

VGhpcyBwYXRjaCBhZGRyZXNzZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nIHNwb3R0ZWQgYnkKdXNp
bmcgY29jY2luZWxsZSB3aGVyZSB0aGUgY2FzZSBjaGVja2VkIGRvZXMgdGhlIHNhbWUKdGhhbiB0
aGUgZWxzZSBjYXNlLgoKZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24zMi9k
aXNwbGF5X21vZGVfdmJhX3V0aWxfMzIuYzo0NjY0OjgtMTA6IFdBUk5JTkc6IHBvc3NpYmxlIGNv
bmRpdGlvbiB3aXRoIG5vIGVmZmVjdCAoaWYgPT0gZWxzZSkKCkZpeGVzOiA5NzRjZTE4MSAoImRy
bS9hbWQvZGlzcGxheTogQWRkIGNoZWNrIGZvciBQU3RhdGUgY2hhbmdlIGluIERDTjMyIikKClNp
Z25lZC1vZmYtYnk6IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkBmb3hob3VuZC5m
aT4KLS0tCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24zMi9kaXNwbGF5X21vZGVfdmJh
X3V0aWxfMzIuYyAgIHwgNCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjMyL2Rpc3Bs
YXlfbW9kZV92YmFfdXRpbF8zMi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rt
bC9kY24zMi9kaXNwbGF5X21vZGVfdmJhX3V0aWxfMzIuYwppbmRleCBlY2VhMDA4ZjE5ZDMuLmQ5
NDBkZmE1YWU0MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rt
bC9kY24zMi9kaXNwbGF5X21vZGVfdmJhX3V0aWxfMzIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjMyL2Rpc3BsYXlfbW9kZV92YmFfdXRpbF8zMi5jCkBAIC00
NjYxLDEwICs0NjYxLDYgQEAgdm9pZCBkbWwzMl9DYWxjdWxhdGVNaW5BbmRNYXhQcmVmZXRjaE1v
ZGUoCiAJfSBlbHNlIGlmIChBbGxvd0ZvclBTdGF0ZUNoYW5nZU9yU3R1dHRlckluVkJsYW5rRmlu
YWwgPT0gZG1fcHJlZmV0Y2hfc3VwcG9ydF91Y2xrX2ZjbGtfYW5kX3N0dXR0ZXIpIHsKIAkJKk1p
blByZWZldGNoTW9kZSA9IDA7CiAJCSpNYXhQcmVmZXRjaE1vZGUgPSAwOwotCX0gZWxzZSBpZiAo
QWxsb3dGb3JQU3RhdGVDaGFuZ2VPclN0dXR0ZXJJblZCbGFua0ZpbmFsID09Ci0JCQlkbV9wcmVm
ZXRjaF9zdXBwb3J0X3VjbGtfZmNsa19hbmRfc3R1dHRlcl9pZl9wb3NzaWJsZSkgewotCQkqTWlu
UHJlZmV0Y2hNb2RlID0gMDsKLQkJKk1heFByZWZldGNoTW9kZSA9IDM7CiAJfSBlbHNlIHsKIAkJ
Kk1pblByZWZldGNoTW9kZSA9IDA7CiAJCSpNYXhQcmVmZXRjaE1vZGUgPSAzOwotLSAKMi4zOS4y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1r
ZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
