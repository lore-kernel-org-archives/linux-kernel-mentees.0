Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F225C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Oct 2023 11:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4FA442447;
	Tue, 31 Oct 2023 11:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4FA442447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZOcBkyWlZAzn; Tue, 31 Oct 2023 11:42:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0246D41748;
	Tue, 31 Oct 2023 11:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0246D41748
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4EA2C0039;
	Tue, 31 Oct 2023 11:42:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2642C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 11:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 687B441748
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 11:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 687B441748
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RHUnWubI6TMz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 11:42:21 +0000 (UTC)
Received: from 7.mo575.mail-out.ovh.net (7.mo575.mail-out.ovh.net
 [46.105.63.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8655841591
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 11:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8655841591
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.4.98])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id D17C5283BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 11:42:18 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-rsqbf (unknown [10.110.103.49])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 03A651FEB0;
 Tue, 31 Oct 2023 11:42:17 +0000 (UTC)
Received: from RCM-web9.webmail.mail.ovh.net ([151.80.29.21])
 by ghost-submission-6684bf9d7b-rsqbf with ESMTPSA
 id xNv7ORnoQGUrvQAA/A58uA
 (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 31 Oct 2023 11:42:17 +0000
MIME-Version: 1.0
Date: Tue, 31 Oct 2023 13:42:17 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drm/amd/display: remove redundant check
In-Reply-To: <2023103115-obstruct-smudgy-6cc6@gregkh>
References: <20231030171748.35482-1-jose.pekkarinen@foxhound.fi>
 <2023103115-obstruct-smudgy-6cc6@gregkh>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <3ab58c1e48447798d7525e7d2f42f1a2@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 185.220.101.158
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
X-Ovh-Tracer-Id: 16724680167312303623
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtvddgfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihoihgtgfesthekjhdttderjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeetveejleefudduueehfedvjeekteevhefhtdffkedvffegieejgeettdeuueeiteenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepuddvjedrtddrtddruddpudekhedrvddvtddruddtuddrudehkedpudehuddrkedtrddvledrvddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth
Cc: dillon.varone@amd.com, george.shen@amd.com, sunpeng.li@amd.com,
 linux-kernel-mentees@lists.linuxfoundation.org, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 aurabindo.pillai@amd.com, samson.tam@amd.com, daniel@ffwll.ch,
 SyedSaaem.Rizvi@amd.com, stable@vger.kernel.org, airlied@gmail.com,
 Jun.Lei@amd.com, harry.wentland@amd.com, christian.koenig@amd.com
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gMjAyMy0xMC0zMSAwNzo0OCwgR3JlZyBLSCB3cm90ZToKPiBPbiBNb24sIE9jdCAzMCwgMjAy
MyBhdCAwNzoxNzo0OFBNICswMjAwLCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+PiBUaGlzIHBh
dGNoIGFkZHJlc3NlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmcgc3BvdHRlZCBieQo+PiB1c2luZyBj
b2NjaW5lbGxlIHdoZXJlIHRoZSBjYXNlIGNoZWNrZWQgZG9lcyB0aGUgc2FtZQo+PiB0aGFuIHRo
ZSBlbHNlIGNhc2UuCj4+IAo+PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rj
bjMyL2Rpc3BsYXlfbW9kZV92YmFfdXRpbF8zMi5jOjQ2NjQ6OC0xMDogCj4+IFdBUk5JTkc6IHBv
c3NpYmxlIGNvbmRpdGlvbiB3aXRoIG5vIGVmZmVjdCAoaWYgPT0gZWxzZSkKPj4gCj4+IEZpeGVz
OiA5NzRjZTE4MSAoImRybS9hbWQvZGlzcGxheTogQWRkIGNoZWNrIGZvciBQU3RhdGUgY2hhbmdl
IGluIAo+PiBEQ04zMiIpCj4+IAo+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IAo+IFdo
eSBpcyB0aGlzIHJlbGV2YW50IGZvciBzdGFibGU/CgogICAgIEhpLAoKICAgICBJIHdhcyBhc2tl
ZCB0byBzZW5kIGl0IGZvciBzdGFibGUgYmVjYXVzZSB0aGlzIGNvZGUKbG9va3MgZGlmZmVyZW50
IGluIGFtZC1zdGFnaW5nLWRybS1uZXh0LCBzZWUgaGVyZS4KCmh0dHBzOi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9hZ2Q1Zi9saW51eC8tL2Jsb2IvYW1kLXN0YWdpbmctZHJtLW5leHQvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24zMi9kaXNwbGF5X21vZGVfdmJhX3V0aWxf
MzIuYyNMNDY2MQoKICAgICBGZWVsIGZyZWUgdG8gbGV0IG1lIGtub3cgaWYgdGhpcyBpcyB3cm9u
Zywgb3IgaWYgSQpuZWVkIHRvIHJldmlldyBzb21lIG90aGVyIGd1aWRlbGluZXMgSSBtYXkgaGF2
ZSBtaXNzZWQuCgogICAgIFRoYW5rcyEKCiAgICAgSm9zw6kuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcg
bGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5l
bC1tZW50ZWVzCg==
