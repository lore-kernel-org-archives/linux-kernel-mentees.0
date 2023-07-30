Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A1BC04A94
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Jul 2023 08:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25CAA403AE;
	Sun, 30 Jul 2023 08:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25CAA403AE
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=NBwsrl4N
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C2yEiDekA6rJ; Sun, 30 Jul 2023 08:28:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D1B0E40122;
	Sun, 30 Jul 2023 08:28:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1B0E40122
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ACD94C0071;
	Sun, 30 Jul 2023 08:28:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF8ADC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 08:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75B2E60A82
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 08:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75B2E60A82
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=NBwsrl4N
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vXizAZATxbiy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 08:28:41 +0000 (UTC)
X-Greylist: delayed 307 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 30 Jul 2023 08:28:40 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B0E260A7E
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B0E260A7E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 08:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1690705718; x=1691310518; i=markus.elfring@web.de;
 bh=f/C2/G691b7jnm+N2Kevvo1xSIbNwuoACTOYnD7y2gs=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=NBwsrl4NKM7MNgI/rNZRBPulOmnrApcGJyzexV2r7yvSqoz0D3PgONTxKxvtYETCZwed68n
 Ik2UklLIVgejM7d+MxdmJwwc4U+bP1sy5P+3C5HJPodag5PLgLL4amvXWULnsW0zJeTxN6BRv
 N3ARW1mSOg1uxob1zVWNG62U8VJ9G9QQ3AfU3KtDuw2YQ46QMajb+q67qpNjo14TmMj9thPhX
 Pco21iHsIDepkWC2Ri8RuMXre+xsS+FZPyS+juHo5bD+tVbP6T7vXnL8SAMaZSGgULV3c1MNG
 zRF36AcqWHetsrRBzCz87Si/FloEth9ZY4PZ+8JAhdXoHwS9dTpQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MgiXQ-1pwR3134yS-00h5Ue; Sun, 30
 Jul 2023 10:23:23 +0200
Message-ID: <85938916-305c-c8b9-89db-45e522616526@web.de>
Date: Sun, 30 Jul 2023 10:23:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: Contributing subsequent patch versions
To: =?UTF-8?Q?Oscar_Megia_L=c3=b3pez?= <megia.oscar@gmail.com>,
 kernel-janitors@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <877cqlmdpg.fsf@gmail.com>
 <8ef54195-4102-0c6c-e14d-efc9bc45cddc@web.de> <877cqk5zdt.fsf@gmail.com>
 <20230728181014.GA607743@mit.edu> <87tttlncib.fsf@gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <87tttlncib.fsf@gmail.com>
X-Provags-ID: V03:K1:ve6JC6nvYQnr8brBCANjeLp8qE88PKilAf+xyzB//x+QM5SdsUZ
 w43nO19UoA9zlpVcAFbjWKzZTpuXBm7+GIlrFdNXMYR1v9+8tHy3xqZIp4wSFqijhtQTFlN
 6XmmEQAPA236X+WuUeNebVR5gxrkSaLQRwJJyNiIvmwoX5pTmg3lw9c2JTaRSpt44trYyDs
 lVvsPFka6A0ICSxP37HvQ==
UI-OutboundReport: notjunk:1;M01:P0:CjRaDEf+O4w=;v/Ft/U+k1EIb72DF7kS4tOeaTQM
 MJ3RY9tBU1I9SgxnEbMLqJhnjNc07ZKtS9wa7zoEijhjCZ5jZFFK74TPpqGW2aLqszGYnvHbp
 NpZz0aKG5cC5hhGBuFGyZ7W+JXGetCQ86A8FXb5jsPYA3ZhNKBEsiNsU+ujb+457X5qS3HiCN
 crmXfxeoSrWI+mNU53K0LmfwSVK01q1g1b/pB/UzBP8kfB2SGf5mhKeI6sa25QvP+fbS1h0ER
 hfXhbK/Ik+ojqLv8NeE2VckP1xXyHpnAG6sPf5+uCV8tUz7Qe/nVUtVlV1doBzZOrCPbJsRef
 ZB7DuZNRACJxrrUyPR5HoJ0OcADG3iZatNdb6UO+tfUeArZ4qD91DMPoaO+u+l+JgH4AwaK7C
 kd9Z2/9ywmbHEjmDlVikf/Hw8sAigz/H0jiwm4k6vw6cTWWDaE2C1IWYCLitpN9Iu1Ucb8LKr
 z0prDCT4y8dzu87Dah0P/oIC6h1gDIzPy8i/0TlwdjtvNIabI+Ae8v0GNTN0G+JwAHwcZXDsD
 NiC3mX5BVddrh6MGFgn5Oqd7s45rAzmCRZd4uf9TozKcMnVUeSs6ZM+1X1aYq8AgaRLUs190P
 7ExHpuRY8gd45gfnK9OyZJJKZdG/uMoRAnYMbJt/twNaxWOslfCZ4txblOESLJ+AMqyzUEq0o
 zQoPTeXBhhBiHidVMx7muz31lgADmyYQ8I7pdc5YjgLZbA6kUEkRLhn0yC7ycuS7UXisbiX7S
 p1P02Ju+KoruaGNLXKir2d5GnXJCFxq1AO/c03rvHYJUJPPJ/RlOzmcg/suqjZgAyNKQWHWW+
 N3d9pGf2xAQFkkZ/FsG9Tk13CfcOQtvwBBuqbJG34sk0LRZL9ppnMlgcygQsJn3EJMHS7mxXr
 oL9Z6nsI3DcZw6eOcOMxnGhSweQ6FzdDhAhziGf8ZrWBfxDykw8BwX5owoyYWO/gTV0zF0JQB
 FuN+lQ==
Cc: linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 LKML <linux-kernel@vger.kernel.org>, Dan Carpenter <error27@gmail.com>
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

PiBUaGFuayB5b3UgdmVyeSBtdWNoLCBUZWQuIFRoYXQncyB3aGF0IEkgd2FzIGFza2luZy4gSSBk
b24ndCBzZWUgdGhlCj4gcG9pbnQgaW4gYm90aGVyaW5nIHRvIHNlbmQgdGhlIHNlY29uZCB2ZXJz
aW9uICh3aGljaCBJJ3ZlIG5ldmVyIGRvbmUpCgpJIGZpbmQgc3VjaCBmZWVkYmFjayBpbnRlcmVz
dGluZyBhbmQgc3VycHJpc2luZyBzb21laG93LgoKCj4gaWYgdGhlcmUncyBzb21lb25lIHdobyBr
bm93cyBob3cgdG8gZG8gaXQgYW5kIGlzIHdpbGxpbmcgdG8gaGVscC4KCkl0IGlzIG9jY2FzaW9u
YWxseSBuaWNlciB0byBnZXQgZGlyZWN0IGhpbnRzIGZyb20gbW9yZSBleHBlcmllbmNlZAp1c2Vy
cyAob3IgZGV2ZWxvcGVycykgaW5zdGVhZCBvZiBwZXJmb3JtaW5nIGFkZGl0aW9uYWwgcmVzZWFy
Y2guCgoKPiBJIHRyaWVkIGl0IGJ5IG15c2VsZgoKSSBpbWFnaW5lIHRoYXQgY29ycmVzcG9uZGlu
ZyBleHBlcmltZW50YXRpb24gY2FuIGJlIGltcHJvdmVkIGZ1cnRoZXIuCkRpZCB5b3Ugc2VuZCBh
bnkgbWVzc2FnZXMgb25seSB0byB5b3Vyc2VsZgoob3IgYSBjdXN0b21pc2VkIGRhdGEgLyBzb2Z0
d2FyZSBhbmFseXNpcyBzeXN0ZW0pIGJlZm9yZT8KCgo+IGFuZCBzZWFyY2hpbmcgdGhlIGludGVy
bmV0CgpZb3UgZm91bmQgc29tZSBhZHZpY2VzIGJ5IERhbiBDYXJwZW50ZXIgYXQgbGVhc3QuCmh0
dHBzOi8vc3RhdGljdGhpbmtpbmcud29yZHByZXNzLmNvbS8yMDIyLzA3LzI3L2hvdy10by1zZW5k
LWEtdjItcGF0Y2gvCgoKPiBhbmQgSSBkaWRuJ3QgZmluZCB0aGUgcmlnaHQgd2F5LgoKVGhlcmUg
YXJlIG1vcmUgcG9zc2liaWxpdGllcyBhdmFpbGFibGUgZm9yIGZ1cnRoZXIgZGV2ZWxvcG1lbnQg
Y29uc2lkZXJhdGlvbnMuCgoKPj4gRmluYWxseSwgd2l0aCByZXNwZWN0IHRvIHlvdXIgb3JpZ2lu
YWwgcGF0Y2guICBNeSBhcG9sb2dpZXMgZm9yIG5vdAo+PiBsb29raW5nIGF0IGl0IGVhcmlsZXIu
ICBJJ20gcHJldHR5IHN3YW1wZWQgdGhlc2UgZGF5cywgd2hpY2ggbWVhbnMKPj4gdGhhdCBJJ20g
cHJpb3JpdGl6aW5nIHdoaWNoIHBhdGNoZXMgZ2V0IG15IGF0dGVudGlvbi4gIEFzIGZhciBhcyB0
aGlzCj4+IHBhcnRpY3VsYXIgcGF0Y2gsIEkgZG9uJ3QgdGhpbmsgaXQncyBhY3RpdmVseSBoYXJt
ZnVsLCBidXQgSSBhbHNvCj4+IGRvbid0IHF1aXRlIHNlZSB0aGUgcG9pbnQuICBJZiB5b3Ugd2Fu
dCB0byBzZWUgaG93IGZ1bGwgYSBmaWxlIHN5c3RlbQo+PiBtaWdodCBiZSwgYW5kIGl0J3MgZGlz
YXBwZWFyaW5nIHRvbyBxdWlja2x5IGJlY2F1c2Ugc2hvcnRseSBhZnRlciBmc2NrCj4+IGZpbmlz
aGVzLCB0aGUgZ3JhcGhpY2FsIGxvZ2luIGhhcyBjb21lIHVwLCB5b3UgY2FuIGFsd2F5cyB1c2Ug
dGhlICJkZiIKPj4gY29tbWFuZCwgcmlnaHQ/CuKApgo+IE9rLCBpZiB5b3UgZG9uJ3QgdGhpbmsg
aXQncyBuZWNlc3NhcnksIEkgd29uJ3Qgc2VuZCB0aGUgdjIuCgpXb3VsZCB5b3UgbGlrZSB0byB0
YWtlIGFub3RoZXIgbG9vayBhdCBhbnkgbW9yZSBpbmZvcm1hdGlvbiBzb3VyY2VzPwoKRXhhbXBs
ZToKaHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvU3RvcmFnZV9NYW5hZ2VtZW50X0luaXRp
YXRpdmVfJUUyJTgwJTkzX1NwZWNpZmljYXRpb24KCgo+IFllc3RlcmRheSBJIHJlYWxpemVkIHRo
YXQgSSBtYWRlIGEgKkJJRyogbWlzdGFrZTogSSBzZW50IHRoZSBlbWFpbCB0byB0aGUKPiB3cm9u
ZyBsaXN0LgoKSXQgc2VlbXMgdGhhdCB5b3UgZGVtb25zdHJhdGUgZ3Jvd2luZyBsZWFybmluZyBl
eHBlcmllbmNlcy4KCgo+ICAgICAgICAgICAgIEkgd2FudGVkIHRvIHNlbmQgdGhlIGVtYWlsIHRv
IHRoZSBsaXN0IGxpbnV4LWtlcm5lbC1tZW50ZWVzCj4gYmVjYXVzZSBJIHRoaW5rIGl0IGlzIHRo
ZSByaWdodCBwbGFjZSB0byBhc2sgdGhlc2UgcXVlc3Rpb25zIGFuZCBub3QKPiBib3RoZXIgdGhl
IGtlcm5lbCBkZXZlbG9wZXJzLCBidXQgbm8gaGFybSBjb21lcyBmcm9tIGdvb2QuCgpUaGUgc2Vs
ZWN0aW9uIG9mIG1lc3NhZ2UgcmVjaXBpZW50cyBjYW4gYWxzbyBiZSBjaGFsbGVuZ2luZy4KCgo+
IEluIHRoaXMgd2F5IE1hcmt1cyBoYXMgdG9sZCBtZSB0YXNrcyB0aGF0IEkgY2FuIGRvIHRvIHN0
YXJ0IGhlbHAgdGhlIGNvbW11bml0eS4KCkkgYmVjYW1lIGN1cmlvdXMgdGhlbiBob3cgY29udHJp
YnV0aW9ucyB3aWxsIGV2b2x2ZSBhY2NvcmRpbmdseS4KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVu
dGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1rZXJuZWwtbWVudGVlcwo=
