Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E92EC4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Oct 2023 09:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1291F42FF4;
	Sun, 29 Oct 2023 09:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1291F42FF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 84XY7RFkszHc; Sun, 29 Oct 2023 09:54:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CF34841451;
	Sun, 29 Oct 2023 09:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF34841451
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B25A3C0039;
	Sun, 29 Oct 2023 09:54:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2AFB5C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 09:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC9B84ECC4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 09:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC9B84ECC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n_TkKsmA6jeb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 09:54:00 +0000 (UTC)
X-Greylist: delayed 300 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 29 Oct 2023 09:53:59 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8F034ECBE
Received: from 14.mo584.mail-out.ovh.net (14.mo584.mail-out.ovh.net
 [46.105.40.29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8F034ECBE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 09:53:59 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.138.174])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id AB25326102
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 09:38:31 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-x2g4z (unknown [10.111.208.154])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9167A1FD2F;
 Sun, 29 Oct 2023 09:38:28 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.107])
 by ghost-submission-6684bf9d7b-x2g4z with ESMTPSA
 id 9QKQHBQoPmXpkwQAjDjF9w
 (envelope-from <jose.pekkarinen@foxhound.fi>); Sun, 29 Oct 2023 09:38:28 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001d53088e7-9f9b-4152-9236-a5a90e87501e,
 2D5A9C8C3C9544CFCEEB4DEE313913C815DB1A20)
 smtp.auth=jose.pekkarinen@foxhound.fi
X-OVh-ClientIp: 87.94.110.144
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 skhan@linuxfoundation.org
Subject: [PATCH] drm/amd/display: remove duplicated argument
Date: Sun, 29 Oct 2023 11:39:26 +0200
Message-Id: <20231029093926.137766-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Ovh-Tracer-Id: 2888777688825374374
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrleekgddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepfedtleeuteeitedvtedtteeuieevudejfeffvdetfeekleehhfelleefteetjeejnecukfhppeduvdejrddtrddtrddupdekjedrleegrdduuddtrddugeegpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth
Cc: dri-devel@lists.freedesktop.org, sunran001@208suo.com, alex.hung@amd.com,
 linux-kernel-mentees@lists.linuxfoundation.org, qingqing.zhuo@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Zhongwei.Zhang@amd.com, Yao.Wang1@amd.com, aurabindo.pillai@amd.com,
 daniel@ffwll.ch, Jun.Lei@amd.com, airlied@gmail.com
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

U3BvdHRlZCBieSBjb2NjaWNoZWNrLCB0aGVyZSBpcyBhIHJlZHVuZGFudCBjaGVjayBmb3IKdi0+
U291cmNlUGl4ZWxGb3JtYXRba10gIT0gZG1fNDQ0XzE2LiBUaGlzIHBhdGNoIHdpbGwKcmVtb3Zl
IGl0LiBUaGUgY29ycmVzcG9uZGluZyBvdXRwdXQgZm9sbG93cy4KCmRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kbWwvZGNuMzAvZGlzcGxheV9tb2RlX3ZiYV8zMC5jOjUxMzA6ODYtMTIy
OiBkdXBsaWNhdGVkIGFyZ3VtZW50IHRvICYmIG9yIHx8CgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBQ
ZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AZm94aG91bmQuZmk+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24zMC9kaXNwbGF5X21vZGVfdmJhXzMwLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjMwL2Rpc3BsYXlfbW9k
ZV92YmFfMzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGNuMzAvZGlz
cGxheV9tb2RlX3ZiYV8zMC5jCmluZGV4IGFkNzQxYTcyM2MwZS4uMzY4NmYxZTdkZTNhIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjMwL2Rpc3BsYXlf
bW9kZV92YmFfMzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rj
bjMwL2Rpc3BsYXlfbW9kZV92YmFfMzAuYwpAQCAtNTEyOCw3ICs1MTI4LDcgQEAgdm9pZCBkbWwz
MF9Nb2RlU3VwcG9ydEFuZFN5c3RlbUNvbmZpZ3VyYXRpb25GdWxsKHN0cnVjdCBkaXNwbGF5X21v
ZGVfbGliICptb2RlX2wKIAkJCVZpZXdwb3J0RXhjZWVkc1N1cmZhY2UgPSB0cnVlOwogCiAJCWlm
ICh2LT5Tb3VyY2VQaXhlbEZvcm1hdFtrXSAhPSBkbV80NDRfNjQgJiYgdi0+U291cmNlUGl4ZWxG
b3JtYXRba10gIT0gZG1fNDQ0XzMyICYmIHYtPlNvdXJjZVBpeGVsRm9ybWF0W2tdICE9IGRtXzQ0
NF8xNgotCQkJCSYmIHYtPlNvdXJjZVBpeGVsRm9ybWF0W2tdICE9IGRtXzQ0NF8xNiAmJiB2LT5T
b3VyY2VQaXhlbEZvcm1hdFtrXSAhPSBkbV80NDRfOCAmJiB2LT5Tb3VyY2VQaXhlbEZvcm1hdFtr
XSAhPSBkbV9yZ2JlKSB7CisJCQkJJiYgdi0+U291cmNlUGl4ZWxGb3JtYXRba10gIT0gZG1fNDQ0
XzggJiYgdi0+U291cmNlUGl4ZWxGb3JtYXRba10gIT0gZG1fcmdiZSkgewogCQkJaWYgKHYtPlZp
ZXdwb3J0V2lkdGhDaHJvbWFba10gPiB2LT5TdXJmYWNlV2lkdGhDW2tdIHx8IHYtPlZpZXdwb3J0
SGVpZ2h0Q2hyb21hW2tdID4gdi0+U3VyZmFjZUhlaWdodENba10pIHsKIAkJCQlWaWV3cG9ydEV4
Y2VlZHNTdXJmYWNlID0gdHJ1ZTsKIAkJCX0KLS0gCjIuMzkuMgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGlu
ZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2Vy
bmVsLW1lbnRlZXMK
