Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1315DCA0ECA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Sep 2023 08:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EBBF418CD;
	Tue, 12 Sep 2023 08:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EBBF418CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vFY83vV9gb6C; Tue, 12 Sep 2023 08:37:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 52D38418C8;
	Tue, 12 Sep 2023 08:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52D38418C8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C13DC0071;
	Tue, 12 Sep 2023 08:37:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A241AC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Sep 2023 08:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68B4781FE5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Sep 2023 08:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68B4781FE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x44Zazs_wODs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Sep 2023 08:37:16 +0000 (UTC)
X-Greylist: delayed 6608 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 12 Sep 2023 08:37:15 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC9E581FE0
Received: from 17.mo550.mail-out.ovh.net (17.mo550.mail-out.ovh.net
 [87.98.179.142])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC9E581FE0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Sep 2023 08:37:15 +0000 (UTC)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.143.238])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id BDF8A26F29
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Sep 2023 06:08:53 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-kpd4h (unknown [10.110.115.102])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3D0591FE4E;
 Tue, 12 Sep 2023 06:08:51 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.109])
 by ghost-submission-6684bf9d7b-kpd4h with ESMTPSA
 id 6IuDB3MAAGU0BQAATyJbxw
 (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 12 Sep 2023 06:08:51 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003e31aa925-4ab6-4d79-ad4c-da4742101120,
 80A6B5525692DB5E4EE3E37D5922F4DF870F3BE7)
 smtp.auth=jose.pekkarinen@foxhound.fi
X-OVh-ClientIp: 82.203.164.12
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: airlied@redhat.com,
	kraxel@redhat.com,
	skhan@linuxfoundation.org
Subject: [PATCH] drm/virtio: clean out_fence on complete_submit
Date: Tue, 12 Sep 2023 09:08:24 +0300
Message-Id: <20230912060824.5210-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Ovh-Tracer-Id: 32932573898188454
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudeihedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepfedtleeuteeitedvtedtteeuieevudejfeffvdetfeekleehhfelleefteetjeejnecukfhppeduvdejrddtrddtrddupdekvddrvddtfedrudeigedruddvpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdfovfetjfhoshhtpehmohehhedtpdhmohguvgepshhmthhpohhuth
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 olvaffe@gmail.com, daniel@ffwll.ch, gurchetansingh@chromium.org,
 virtualization@lists.linux-foundation.org, christian.koenig@amd.com
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

VGhlIHJlbW92ZWQgbGluZSBwcmV2ZW50cyB0aGUgZm9sbG93aW5nIGNsZWFudXAgZnVuY3Rpb24K
dG8gZXhlY3V0ZSBhIGRtYV9mZW5jZV9wdXQgb24gdGhlIG91dF9mZW5jZSB0byBmcmVlIGl0cwpt
ZW1vcnksIHByb2R1Y2luZyB0aGUgZm9sbG93aW5nIG91dHB1dCBpbiBrbWVtbGVhazoKCnVucmVm
ZXJlbmNlZCBvYmplY3QgMHhmZmZmODg4MTI2ZDhlZTAwIChzaXplIDEyOCk6CiAgY29tbSAia3dp
bl93YXlsYW5kIiwgcGlkIDk4MSwgamlmZmllcyA0Mjk1MzgwMjk2IChhZ2UgMzkwLjA2MHMpCiAg
aGV4IGR1bXAgKGZpcnN0IDMyIGJ5dGVzKToKICAgIGM4IGExIGMyIDI3IDgxIDg4IGZmIGZmIGUw
IDE0IGE5IGMwIGZmIGZmIGZmIGZmICAuLi4nLi4uLi4uLi4uLi4uCiAgICAzMCAxYSBlMSAyZSBh
NiAwMCAwMCAwMCAyOCBmYyA1YiAxNyA4MSA4OCBmZiBmZiAgMC4uLi4uLi4oLlsuLi4uLgogIGJh
Y2t0cmFjZToKICAgIFs8MDAwMDAwMDAxMTY1NTY2MT5dIGttYWxsb2NfdHJhY2UrMHgyNi8weGEw
CiAgICBbPDAwMDAwMDAwNTVmMTViODI+XSB2aXJ0aW9fZ3B1X2ZlbmNlX2FsbG9jKzB4NDcvMHhj
MCBbdmlydGlvX2dwdV0KICAgIFs8MDAwMDAwMDBmYTZkOTZmOT5dIHZpcnRpb19ncHVfZXhlY2J1
ZmZlcl9pb2N0bCsweDFhOC8weDgwMCBbdmlydGlvX2dwdV0KICAgIFs8MDAwMDAwMDBlNmNiNTEw
NT5dIGRybV9pb2N0bF9rZXJuZWwrMHgxNjkvMHgyNDAgW2RybV0KICAgIFs8MDAwMDAwMDA1YWQz
M2UyNz5dIGRybV9pb2N0bCsweDM5OS8weDZiMCBbZHJtXQogICAgWzwwMDAwMDAwMGExOWRiZjY1
Pl0gX194NjRfc3lzX2lvY3RsKzB4YzUvMHgxMDAKICAgIFs8MDAwMDAwMDAxMWZhODAxZT5dIGRv
X3N5c2NhbGxfNjQrMHg1Yi8weGMwCiAgICBbPDAwMDAwMDAwNjVjNzZkOGE+XSBlbnRyeV9TWVND
QUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg2ZS8weGQ4CnVucmVmZXJlbmNlZCBvYmplY3QgMHhmZmZm
ODg4MTIxOTMwNTAwIChzaXplIDEyOCk6CiAgY29tbSAia3dpbl93YXlsYW5kIiwgcGlkIDk4MSwg
amlmZmllcyA0Mjk1MzgwMzEzIChhZ2UgMzkwLjA5NnMpCiAgaGV4IGR1bXAgKGZpcnN0IDMyIGJ5
dGVzKToKICAgIGM4IGExIGMyIDI3IDgxIDg4IGZmIGZmIGUwIDE0IGE5IGMwIGZmIGZmIGZmIGZm
ICAuLi4nLi4uLi4uLi4uLi4uCiAgICBmOSBlYyBkNyAyZiBhNiAwMCAwMCAwMCAyOCBmYyA1YiAx
NyA4MSA4OCBmZiBmZiAgLi4uLy4uLi4oLlsuLi4uLgogIGJhY2t0cmFjZToKICAgIFs8MDAwMDAw
MDAxMTY1NTY2MT5dIGttYWxsb2NfdHJhY2UrMHgyNi8weGEwCiAgICBbPDAwMDAwMDAwNTVmMTVi
ODI+XSB2aXJ0aW9fZ3B1X2ZlbmNlX2FsbG9jKzB4NDcvMHhjMCBbdmlydGlvX2dwdV0KICAgIFs8
MDAwMDAwMDBmYTZkOTZmOT5dIHZpcnRpb19ncHVfZXhlY2J1ZmZlcl9pb2N0bCsweDFhOC8weDgw
MCBbdmlydGlvX2dwdV0KICAgIFs8MDAwMDAwMDBlNmNiNTEwNT5dIGRybV9pb2N0bF9rZXJuZWwr
MHgxNjkvMHgyNDAgW2RybV0KICAgIFs8MDAwMDAwMDA1YWQzM2UyNz5dIGRybV9pb2N0bCsweDM5
OS8weDZiMCBbZHJtXQogICAgWzwwMDAwMDAwMGExOWRiZjY1Pl0gX194NjRfc3lzX2lvY3RsKzB4
YzUvMHgxMDAKICAgIFs8MDAwMDAwMDAxMWZhODAxZT5dIGRvX3N5c2NhbGxfNjQrMHg1Yi8weGMw
CiAgICBbPDAwMDAwMDAwNjVjNzZkOGE+XSBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUr
MHg2ZS8weGQ4ClsuLi5dCgpUaGlzIG1lbWxlYWsgd2lsbCBncm93IHF1aWNrbHksIGJlaW5nIHBv
c3NpYmxlIHRvIHNlZSB0aGUKZm9sbG93aW5nIGxpbmUgaW4gZG1lc2cgYWZ0ZXIgZmV3IG1pbnV0
ZXMgb2YgbGlmZSBpbiB0aGUKdmlydHVhbCBtYWNoaW5lOgoKWyAgNzA2LjIxNzM4OF0ga21lbWxl
YWs6IDEwNzMxIG5ldyBzdXNwZWN0ZWQgbWVtb3J5IGxlYWtzIChzZWUgL3N5cy9rZXJuZWwvZGVi
dWcva21lbWxlYWspCgpUaGUgcGF0Y2ggd2lsbCByZW1vdmUgdGhlIGxpbmUgdG8gYWxsb3cgdGhl
IGNsZWFudXAKZnVuY3Rpb24gZG8gaXRzIGpvYi4KClNpZ25lZC1vZmYtYnk6IEpvc8OpIFBla2th
cmluZW4gPGpvc2UucGVra2FyaW5lbkBmb3hob3VuZC5maT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfc3VibWl0LmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3N1Ym1pdC5j
IGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3N1Ym1pdC5jCmluZGV4IDNjMDAxMzVl
YWQ0NS4uNWM1MTQ5NDZiYmFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfc3VibWl0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3N1Ym1p
dC5jCkBAIC0zNjEsNyArMzYxLDYgQEAgc3RhdGljIHZvaWQgdmlydGlvX2dwdV9jb21wbGV0ZV9z
dWJtaXQoc3RydWN0IHZpcnRpb19ncHVfc3VibWl0ICpzdWJtaXQpCiAJc3VibWl0LT5idWYgPSBO
VUxMOwogCXN1Ym1pdC0+YnVmbGlzdCA9IE5VTEw7CiAJc3VibWl0LT5zeW5jX2ZpbGUgPSBOVUxM
OwotCXN1Ym1pdC0+b3V0X2ZlbmNlID0gTlVMTDsKIAlzdWJtaXQtPm91dF9mZW5jZV9mZCA9IC0x
OwogfQogCi0tIAoyLjM5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwt
bWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
