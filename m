Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680DEC4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Oct 2023 17:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E617F40347;
	Mon, 30 Oct 2023 17:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E617F40347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yWBQNR4i4KA1; Mon, 30 Oct 2023 17:17:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C8C674021C;
	Mon, 30 Oct 2023 17:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8C674021C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7AF8C0071;
	Mon, 30 Oct 2023 17:17:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E0F3C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 17:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39B7B60774
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 17:17:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39B7B60774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EMpKTYN9FMEJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 17:17:56 +0000 (UTC)
Received: from 3.mo584.mail-out.ovh.net (3.mo584.mail-out.ovh.net
 [46.105.57.129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED0A760AD8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 17:17:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED0A760AD8
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.138.16])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id DBE272713F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 17:17:53 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-7pdj5 (unknown [10.110.115.40])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A3AD81FE93;
 Mon, 30 Oct 2023 17:17:52 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.108])
 by ghost-submission-6684bf9d7b-7pdj5 with ESMTPSA
 id ciZaJEDlP2V+SAEAhpL/bw
 (envelope-from <jose.pekkarinen@foxhound.fi>); Mon, 30 Oct 2023 17:17:52 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S002f7264df6-502a-4d3d-8901-f89f427d1744,
 1521F8BC68C4446D6F30831D87711B1BDC7B9471)
 smtp.auth=jose.pekkarinen@foxhound.fi
X-OVh-ClientIp: 91.157.109.247
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 skhan@linuxfoundation.org
Subject: [PATCH] drm/amd/display: remove redundant check
Date: Mon, 30 Oct 2023 19:17:48 +0200
Message-Id: <20231030171748.35482-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Ovh-Tracer-Id: 16519484912439764646
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddttddgleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeeftdelueetieetvdettdetueeivedujeefffdvteefkeelhefhleelfeetteejjeenucfkphepuddvjedrtddrtddruddpledurdduheejrddutdelrddvgeejpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth
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
bS9hbWQvZGlzcGxheTogQWRkIGNoZWNrIGZvciBQU3RhdGUgY2hhbmdlIGluIERDTjMyIikKCkNj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEpvc8OpIFBla2thcmluZW4g
PGpvc2UucGVra2FyaW5lbkBmb3hob3VuZC5maT4KLS0tCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2Rj
L2RtbC9kY24zMi9kaXNwbGF5X21vZGVfdmJhX3V0aWxfMzIuYyAgIHwgNCAtLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZG1sL2RjbjMyL2Rpc3BsYXlfbW9kZV92YmFfdXRpbF8zMi5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24zMi9kaXNwbGF5X21vZGVfdmJhX3V0aWxf
MzIuYwppbmRleCBlY2VhMDA4ZjE5ZDMuLmQ5NDBkZmE1YWU0MyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24zMi9kaXNwbGF5X21vZGVfdmJhX3V0aWxf
MzIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjMyL2Rpc3Bs
YXlfbW9kZV92YmFfdXRpbF8zMi5jCkBAIC00NjYxLDEwICs0NjYxLDYgQEAgdm9pZCBkbWwzMl9D
YWxjdWxhdGVNaW5BbmRNYXhQcmVmZXRjaE1vZGUoCiAJfSBlbHNlIGlmIChBbGxvd0ZvclBTdGF0
ZUNoYW5nZU9yU3R1dHRlckluVkJsYW5rRmluYWwgPT0gZG1fcHJlZmV0Y2hfc3VwcG9ydF91Y2xr
X2ZjbGtfYW5kX3N0dXR0ZXIpIHsKIAkJKk1pblByZWZldGNoTW9kZSA9IDA7CiAJCSpNYXhQcmVm
ZXRjaE1vZGUgPSAwOwotCX0gZWxzZSBpZiAoQWxsb3dGb3JQU3RhdGVDaGFuZ2VPclN0dXR0ZXJJ
blZCbGFua0ZpbmFsID09Ci0JCQlkbV9wcmVmZXRjaF9zdXBwb3J0X3VjbGtfZmNsa19hbmRfc3R1
dHRlcl9pZl9wb3NzaWJsZSkgewotCQkqTWluUHJlZmV0Y2hNb2RlID0gMDsKLQkJKk1heFByZWZl
dGNoTW9kZSA9IDM7CiAJfSBlbHNlIHsKIAkJKk1pblByZWZldGNoTW9kZSA9IDA7CiAJCSpNYXhQ
cmVmZXRjaE1vZGUgPSAzOwotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGlu
dXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVl
cwo=
