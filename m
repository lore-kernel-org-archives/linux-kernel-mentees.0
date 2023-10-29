Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB77C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Oct 2023 12:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D372984EE9;
	Sun, 29 Oct 2023 12:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D372984EE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nDOgpAk2kJEG; Sun, 29 Oct 2023 12:52:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B45B184EE3;
	Sun, 29 Oct 2023 12:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B45B184EE3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8616FC0071;
	Sun, 29 Oct 2023 12:52:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BACFAC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 12:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90DC76F56D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 12:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90DC76F56D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2YMzMT4RjATH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 12:52:47 +0000 (UTC)
Received: from 1.mo582.mail-out.ovh.net (1.mo582.mail-out.ovh.net
 [46.105.56.136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CDAB46150D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 12:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDAB46150D
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.138.205])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 810FC2546A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 12:44:26 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-9glgx (unknown [10.110.103.93])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 222291FE51;
 Sun, 29 Oct 2023 12:44:23 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.107])
 by ghost-submission-6684bf9d7b-9glgx with ESMTPSA
 id TGu9AadTPmX5kQMAW1D1+g
 (envelope-from <jose.pekkarinen@foxhound.fi>); Sun, 29 Oct 2023 12:44:23 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0013dc59c63-7237-4b8e-b1f2-ef5aba89673c,
 2D5A9C8C3C9544CFCEEB4DEE313913C815DB1A20)
 smtp.auth=jose.pekkarinen@foxhound.fi
X-OVh-ClientIp: 87.94.110.144
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 skhan@linuxfoundation.org
Subject: [PATCH] drm/amd/display: remove redundant check
Date: Sun, 29 Oct 2023 14:44:04 +0200
Message-Id: <20231029124404.16159-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6028631051890370214
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrleekgdegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepfedtleeuteeitedvtedtteeuieevudejfeffvdetfeekleehhfelleefteetjeejnecukfhppeduvdejrddtrddtrddupdekjedrleegrdduuddtrddugeegpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
Cc: dillon.varone@amd.com, linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, samson.tam@amd.com, SyedSaaem.Rizvi@amd.com,
 aurabindo.pillai@amd.com, amd-gfx@lists.freedesktop.org, daniel@ffwll.ch,
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
bmRpdGlvbiB3aXRoIG5vIGVmZmVjdCAoaWYgPT0gZWxzZSkKClNpZ25lZC1vZmYtYnk6IEpvc8Op
IFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkBmb3hob3VuZC5maT4KLS0tCiAuLi4vZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RtbC9kY24zMi9kaXNwbGF5X21vZGVfdmJhX3V0aWxfMzIuYyAgIHwgNCAt
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjMyL2Rpc3BsYXlfbW9kZV92YmFfdXRpbF8z
Mi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24zMi9kaXNwbGF5X21v
ZGVfdmJhX3V0aWxfMzIuYwppbmRleCBlY2VhMDA4ZjE5ZDMuLmQ5NDBkZmE1YWU0MyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24zMi9kaXNwbGF5X21v
ZGVfdmJhX3V0aWxfMzIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1s
L2RjbjMyL2Rpc3BsYXlfbW9kZV92YmFfdXRpbF8zMi5jCkBAIC00NjYxLDEwICs0NjYxLDYgQEAg
dm9pZCBkbWwzMl9DYWxjdWxhdGVNaW5BbmRNYXhQcmVmZXRjaE1vZGUoCiAJfSBlbHNlIGlmIChB
bGxvd0ZvclBTdGF0ZUNoYW5nZU9yU3R1dHRlckluVkJsYW5rRmluYWwgPT0gZG1fcHJlZmV0Y2hf
c3VwcG9ydF91Y2xrX2ZjbGtfYW5kX3N0dXR0ZXIpIHsKIAkJKk1pblByZWZldGNoTW9kZSA9IDA7
CiAJCSpNYXhQcmVmZXRjaE1vZGUgPSAwOwotCX0gZWxzZSBpZiAoQWxsb3dGb3JQU3RhdGVDaGFu
Z2VPclN0dXR0ZXJJblZCbGFua0ZpbmFsID09Ci0JCQlkbV9wcmVmZXRjaF9zdXBwb3J0X3VjbGtf
ZmNsa19hbmRfc3R1dHRlcl9pZl9wb3NzaWJsZSkgewotCQkqTWluUHJlZmV0Y2hNb2RlID0gMDsK
LQkJKk1heFByZWZldGNoTW9kZSA9IDM7CiAJfSBlbHNlIHsKIAkJKk1pblByZWZldGNoTW9kZSA9
IDA7CiAJCSpNYXhQcmVmZXRjaE1vZGUgPSAzOwotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWls
aW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1r
ZXJuZWwtbWVudGVlcwo=
