Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20848C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Oct 2023 12:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C4AC61362;
	Tue, 31 Oct 2023 12:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C4AC61362
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fEGdyCFZhZyK; Tue, 31 Oct 2023 12:49:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 830A96136B;
	Tue, 31 Oct 2023 12:49:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 830A96136B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60CB7C0039;
	Tue, 31 Oct 2023 12:49:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 890F3C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 12:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5715D83AA3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 12:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5715D83AA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RHtY1MRMo6Zr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 12:49:02 +0000 (UTC)
Received: from 16.mo550.mail-out.ovh.net (16.mo550.mail-out.ovh.net
 [178.33.104.224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FC4483AA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 12:49:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FC4483AA1
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.1.232])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 3E59023E18
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 12:32:05 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-wdl7v (unknown [10.110.103.4])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C15581FE98;
 Tue, 31 Oct 2023 12:32:04 +0000 (UTC)
Received: from RCM-web9.webmail.mail.ovh.net ([151.80.29.21])
 by ghost-submission-6684bf9d7b-wdl7v with ESMTPSA
 id WQlLKsTzQGWB1AAAnh/Cbw
 (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 31 Oct 2023 12:32:04 +0000
MIME-Version: 1.0
Date: Tue, 31 Oct 2023 14:32:02 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drm/amd/display: remove redundant check
In-Reply-To: <2023103141-clear-scale-897a@gregkh>
References: <20231030171748.35482-1-jose.pekkarinen@foxhound.fi>
 <2023103115-obstruct-smudgy-6cc6@gregkh>
 <3ab58c1e48447798d7525e7d2f42f1a2@foxhound.fi>
 <2023103141-clear-scale-897a@gregkh>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <1175edcbdf0d0a55d39a87f220259528@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 213.216.208.215
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
X-Ovh-Tracer-Id: 17565445922061264391
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtvddggedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihoihgtgfesthekjhdttderjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeeihfevgfduveejjefgffehkeduhfejteegieejheetgedvleetlefguddukeefleenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupddvudefrddvudeirddvtdekrddvudehpdduhedurdektddrvdelrddvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugihfohhunhgurghtihhonhdrohhrghdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht
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

T24gMjAyMy0xMC0zMSAxNDoyMCwgR3JlZyBLSCB3cm90ZToKPiBPbiBUdWUsIE9jdCAzMSwgMjAy
MyBhdCAwMTo0MjoxN1BNICswMjAwLCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+PiBPbiAyMDIz
LTEwLTMxIDA3OjQ4LCBHcmVnIEtIIHdyb3RlOgo+PiA+IE9uIE1vbiwgT2N0IDMwLCAyMDIzIGF0
IDA3OjE3OjQ4UE0gKzAyMDAsIEpvc8OpIFBla2thcmluZW4gd3JvdGU6Cj4+ID4gPiBUaGlzIHBh
dGNoIGFkZHJlc3NlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmcgc3BvdHRlZCBieQo+PiA+ID4gdXNp
bmcgY29jY2luZWxsZSB3aGVyZSB0aGUgY2FzZSBjaGVja2VkIGRvZXMgdGhlIHNhbWUKPj4gPiA+
IHRoYW4gdGhlIGVsc2UgY2FzZS4KPj4gPiA+Cj4+ID4gPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZG1sL2RjbjMyL2Rpc3BsYXlfbW9kZV92YmFfdXRpbF8zMi5jOjQ2NjQ6OC0xMDoK
Pj4gPiA+IFdBUk5JTkc6IHBvc3NpYmxlIGNvbmRpdGlvbiB3aXRoIG5vIGVmZmVjdCAoaWYgPT0g
ZWxzZSkKPj4gPiA+Cj4+ID4gPiBGaXhlczogOTc0Y2UxODEgKCJkcm0vYW1kL2Rpc3BsYXk6IEFk
ZCBjaGVjayBmb3IgUFN0YXRlIGNoYW5nZSBpbgo+PiA+ID4gRENOMzIiKQo+PiA+ID4KPj4gPiA+
IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4+ID4KPj4gPiBXaHkgaXMgdGhpcyByZWxldmFu
dCBmb3Igc3RhYmxlPwo+PiAKPj4gICAgIEhpLAo+PiAKPj4gICAgIEkgd2FzIGFza2VkIHRvIHNl
bmQgaXQgZm9yIHN0YWJsZSBiZWNhdXNlIHRoaXMgY29kZQo+PiBsb29rcyBkaWZmZXJlbnQgaW4g
YW1kLXN0YWdpbmctZHJtLW5leHQsIHNlZSBoZXJlLgo+PiAKPj4gaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL2FnZDVmL2xpbnV4Ly0vYmxvYi9hbWQtc3RhZ2luZy1kcm0tbmV4dC9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjMyL2Rpc3BsYXlfbW9kZV92YmFfdXRp
bF8zMi5jI0w0NjYxCj4gCj4gSSBkb24ndCBrbm93IHdoYXQgSSBhbSBsb29raW5nIGF0LCBzb3Jy
eS4KPiAKPj4gICAgIEZlZWwgZnJlZSB0byBsZXQgbWUga25vdyBpZiB0aGlzIGlzIHdyb25nLCBv
ciBpZiBJCj4+IG5lZWQgdG8gcmV2aWV3IHNvbWUgb3RoZXIgZ3VpZGVsaW5lcyBJIG1heSBoYXZl
IG1pc3NlZC4KPiAKPiBQbGVhc2Ugc2VlIHRoZSBsaXN0IG9mIHJ1bGVzIGZvciBzdGFibGUgcGF0
Y2hlczoKPiAgICAgCj4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJv
Y2Vzcy9zdGFibGUta2VybmVsLXJ1bGVzLmh0bWwKPiAKPiBEb2VzICJyZW1vdmUgY29kZSB0aGF0
IGRvZXMgbm90aGluZyIgZml0IGhlcmU/CgogICAgIFllcCwgaXQgaXMgYSB0cml2aWFsIGZpeCB3
aGljaCBjb21waWxlcnMgc2hvdWxkIGJlIGFibGUKdG8gb3B0aW1pemUsIHNvIG5vIHJlYWwgYmVu
ZWZpdCB0byB0aGUgdXNlci4gU29ycnkgR3JlZyEKCiAgICAgSm9zw6kuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1h
aWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWtlcm5lbC1tZW50ZWVzCg==
