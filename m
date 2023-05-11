Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B016BC7EE22
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 May 2023 01:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C23160E61;
	Thu, 11 May 2023 01:07:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C23160E61
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=e/mCx6wL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y2EA2yoEDssY; Thu, 11 May 2023 01:07:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C99E160E3F;
	Thu, 11 May 2023 01:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C99E160E3F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0A40C0037;
	Thu, 11 May 2023 01:07:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88F25C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 May 2023 01:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5065884379
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 May 2023 01:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5065884379
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=e/mCx6wL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LCTvdMB6eFrg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 May 2023 01:07:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E72F842A0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E72F842A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 May 2023 01:07:33 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-96652cb7673so758113366b.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 18:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683767251; x=1686359251;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WBFVTTTsvzVv70iU9CVp0O8INXKx7ewdVL5aIiLNN2U=;
 b=e/mCx6wL3ikdgTkS6CB5+AVSzY4AVgz09Ncp5j58wkv/kquL+YWrSzaTyVxy65cQd7
 hwY2Un1NQ08yARrzLLKz7yXreB4720ev8/4z3mObwXkBZQpaF/xg1FRlw0PpSr9thGio
 J/rMAkjKaW+igQx2qDn13145BVNx/b00JiUoV+ntYjE7+hxLWiN9dsT/CV2bu4mnwx5t
 4s6uxOvkS/GhP2V8nrCPsJip/UkimPiJQhWL4e4D3Ob5+5KgTen0Yl6loO96I5pjO2e0
 qe1F73CjbQVkIs2zR3d8nNSK6ggGno2VoqGrpHEmpaSkp2yp3cDjIkWqMqbDC0pPXsZs
 UAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683767251; x=1686359251;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WBFVTTTsvzVv70iU9CVp0O8INXKx7ewdVL5aIiLNN2U=;
 b=R1trpy61Dqwq7zj6ErjmVZVFUDsD2LNzGOLTWEV93QScC5C/vgDBehzGGGx4xOjzu9
 7ZT2fiMjVaeeYIDzHoCrQvic/BLsXlig8V2CCaSXa3OjxnyMBW6H2zGAT/XpP11S3OKF
 4w2SgWYNJzZS80FWjWxrEwk44Rc5W/0rdqqodkVEnbCdG8Heey+51dxcfP74wM9vKp9+
 +bqdhRQqid6Lh7XQbQaJVKnIx0a5H06jAHVeNg3OjoowIcMjHHSs3YAdGsZDb3Cz3aOC
 hOh1btgiS0b0viwqsG8fSThR/TwvHa8zJK2hI13Z7wfg11XYvKqYpR0tA4gtuTuVOdNd
 OEog==
X-Gm-Message-State: AC+VfDy4MmRPXpLuvAEMNYdp/8ZZNw4piSH5/ezc99jxfDmPiQVgifg1
 CD7OhlfQsL03PpmY9PQ507YV6d+RlQjBE4TpkBQ=
X-Google-Smtp-Source: ACHHUZ6y6d+r8/mc7BzoqQn93iv7U0535yE6s3qi/zBmO1f5IIMiJ71mfO3Nu/tyuP/FMMc2KDvKzoU1AAH9FLH3804=
X-Received: by 2002:a17:906:fe01:b0:94f:322d:909d with SMTP id
 wy1-20020a170906fe0100b0094f322d909dmr17099288ejb.63.1683767250852; Wed, 10
 May 2023 18:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdYzYp6=mYSoUHN3TEXVSMbRt1HpRm0X_4RMez09V0XzQewaw@mail.gmail.com>
 <ZFwC/seTfSoaLn0v@bhelgaas>
In-Reply-To: <ZFwC/seTfSoaLn0v@bhelgaas>
From: Peter Geis <pgwipeout@gmail.com>
Date: Wed, 10 May 2023 21:07:18 -0400
Message-ID: <CAMdYzYoa8dhmBx5MUG0yBPwVVXPXHrYNnR0QvKHXvV=JaKuMfw@mail.gmail.com>
Subject: Re: [PATCH v1] drivers: pci: introduce configurable delay for
 Rockchip PCIe bus scan
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: kw@linux.com, heiko@sntech.de, robh@kernel.org, linux-pci@vger.kernel.org,
 shawn.lin@rock-chips.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 linux-rockchip@lists.infradead.org, broonie@kernel.org, bhelgaas@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org, lpieralisi@kernel.org,
 linux-arm-kernel@lists.infradead.org, Dan Johansen <strit@manjaro.org>
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

T24gV2VkLCBNYXkgMTAsIDIwMjMgYXQgNDo0OOKAr1BNIEJqb3JuIEhlbGdhYXMgPGhlbGdhYXNA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAwOSwgMjAyMyBhdCAwODoxMToyOVBN
IC0wNDAwLCBQZXRlciBHZWlzIHdyb3RlOgo+ID4gT24gVHVlLCBNYXkgOSwgMjAyMyBhdCA1OjE5
4oCvUE0gQmpvcm4gSGVsZ2FhcyA8aGVsZ2Fhc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gT24g
VHVlLCBNYXkgMDksIDIwMjMgYXQgMDU6Mzk6MTJQTSArMDIwMCwgVmluY2Vuem8gUGFsYXp6byB3
cm90ZToKPiA+ID4gPiBBZGQgYSBjb25maWd1cmFibGUgZGVsYXkgdG8gdGhlIFJvY2tjaGlwIFBD
SWUgZHJpdmVyIHRvIGFkZHJlc3MKPiA+ID4gPiBjcmFzaGVzIHRoYXQgb2NjdXIgb24gc29tZSBv
bGQgZGV2aWNlcywgc3VjaCBhcyB0aGUgUGluZTY0IFJvY2tQcm82NC4KPiA+ID4gPgo+ID4gPiA+
IFRoaXMgaXNzdWUgaXMgYWZmZWN0aW5nIHRoZSBBUk0gY29tbXVuaXR5LCBidXQgdGhlcmUgaXMg
bm8KPiA+ID4gPiB1cHN0cmVhbSBzb2x1dGlvbiBmb3IgaXQgeWV0Lgo+ID4gPgo+ID4gPiBJdCBz
b3VuZHMgbGlrZSB0aGlzIGhhcHBlbnMgd2l0aCBzZXZlcmFsIGVuZHBvaW50cywgcmlnaHQ/ICBB
bmQgSQo+ID4gPiBhc3N1bWUgdGhlIGVuZHBvaW50cyB3b3JrIGZpbmUgaW4gb3RoZXIgbm9uLVJv
Y2tjaGlwIHN5c3RlbXM/ICBJZgo+ID4gPiB0aGF0J3MgdGhlIGNhc2UsIG15IGd1ZXNzIGlzIHRo
ZSBwcm9ibGVtIGlzIHdpdGggdGhlIFJvY2tjaGlwIGhvc3QKPiA+ID4gY29udHJvbGxlciBhbmQg
aG93IGl0J3MgaW5pdGlhbGl6ZWQsIG5vdCB3aXRoIHRoZSBlbmRwb2ludHMuCj4gPiA+IC4uLgo+
Cj4gPiBUaGUgbWFpbiBpc3N1ZSB3aXRoIHRoZSByazMzOTkgaXMgdGhlIFBDSWUgY29udHJvbGxl
ciBpcyBidWdneSBhbmQKPiA+IHRyaWdnZXJzIGEgU29DIHBhbmljIHdoZW4gY2VydGFpbiBlcnJv
ciBjb25kaXRpb25zIG9jY3VyIHRoYXQgc2hvdWxkCj4gPiBiZSBoYW5kbGVkIGdyYWNlZnVsbHku
IE9uZSBvZiB0aG9zZSBjb25kaXRpb25zIGlzIHdoZW4gYW4gZW5kcG9pbnQKPiA+IHJlcXVlc3Rz
IGFuIGFjY2VzcyB0byB3YWl0IGFuZCByZXRyeSBsYXRlci4KPgo+IEkgYXNzdW1lIHRoaXMgcmVm
ZXJzIHRvIGEgQ29tcGxldGlvbiB3aXRoIFJlcXVlc3QgUmV0cnkgU3RhdHVzIChSUlMpPwoKSSdt
IG5vdCBzdXJlIHRoZSBmdWxsIGNvdmVyYWdlLCB0aGUgdGVzdCBwYXRjaCBmcm9tIFNoYXduIExp
biB0aGF0CmFsbG93ZWQgdGhlIHN5c3RlbSB0byBoYW5kbGUgdGhlIGVycm9ycyBoYXMgdGhlIGZv
bGxvd2luZyBkZXNjcmlwdGlvbjoKIk5hdGl2ZSBkZWZlY3QgcHJldmVudHMgdGhpcyBSQyBmYXIg
ZnJvbSBzdXBwb3J0aW5nIGFueSByZXNwb25zZSBmcm9tCkVQIHdoaWNoIFVSIGZpbGVkIGlzIHNl
dC4iCgo+Cj4gPiBNYW55IHllYXJzIGFnbyB3ZSByYW4gdGhhdCBpc3N1ZSB0byBncm91bmQgYW5k
IHdpdGggUm9iaW4gTXVycGh5J3MKPiA+IGhlbHAgd2UgZm91bmQgdGhhdCB3aGlsZSBpdCdzIHBv
c3NpYmxlIHRvIGdyYWNlZnVsbHkgaGFuZGxlIHRoYXQKPiA+IGNvbmRpdGlvbiBpdCByZXF1aXJl
ZCBoaWphY2tpbmcgdGhlIGVudGlyZSBhcm02NCBlcnJvciBoYW5kbGluZwo+ID4gcm91dGluZS4g
Tm90IGV4YWN0bHkgc2NhbGFibGUgZm9yIGp1c3Qgb25lIFNvQy4KPgo+IERvIHlvdSBoYXZlIGEg
cG9pbnRlciB0byB0aGF0IGRpc2N1c3Npb24/ICBUaGUgVVJMIG1pZ2h0IHNhdmUKPiByZXBlYXRp
bmcgdGhlIHdob2xlIGV4ZXJjaXNlIGFuZCBjb3VsZCBiZSB1c2VmdWwgZm9yIHRoZSBjb21taXQg
bG9nCj4gd2hlbiB3ZSB0cnkgdG8gcmVzb2x2ZSB0aGlzLgoKVGhlIGxpbmsgdG8gdGhlIHBhdGNo
IGVtYWlsIGlzIGhlcmUsIHRoZSBmdWxsIGRpc2N1c3Npb24gaXMgcHJldHR5CmVhc3kgdG8gZm9s
bG93OgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1wY2kvMmEzODEzODQtOWQ0Ny1hN2Uy
LTY3OWMtNzgwOTUwY2Q4NjJkQHJvY2stY2hpcHMuY29tLwpBbHNvOgpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1yb2NrY2hpcC8xZjE4MGQ0Yi05ZTVkLWM4MjktNTU1Yi1jOTc1MDk0MDM2
MWVAd2ViLmRlL1QvI205YzlkNGEyOGEwZDNhYTA2NDg2NGYxODhiOGVlM2IxNmNlMTA3YWZmCgo+
Cj4gPiBUaGUgY29uZmlndXJhYmxlIHdhaXRzIGFsbG93IHVzIHRvIHByb2dyYW0gcmVhc29uYWJs
ZSB0aW1lcyBmb3IKPiA+IDkwJSBvZiB0aGUgZW5kcG9pbnRzIHRoYXQgY29tZSB1cCBpbiB0aGUg
bm9ybWFsIGFtb3VudCBvZiB0aW1lLCB3aGlsZQo+ID4gYmVpbmcgYWJsZSB0byBhZGp1c3QgaXQg
Zm9yIHRoZSBvdGhlciAxMCUgdGhhdCBkbyBub3QuIFNvbWUgcmVxdWlyZQo+ID4gbXVsdGlwbGUg
c2Vjb25kcyBiZWZvcmUgdGhleSByZXR1cm4gd2l0aG91dCBlcnJvci4gUGFydCBvZiB0aGUgcmVh
c29uCj4gPiB3ZSBkb24ndCB3YW50IHRvIGhhcmRjb2RlIHRoZSB3YWl0IHRpbWUgaXMgYmVjYXVz
ZSB0aGUgcHJvYmUgaXNuJ3QKPiA+IGhhbmRsZWQgYXN5bmNocm9ub3VzbHksIHNvIHRoZSBrZXJu
ZWwgYXBwZWFycyB0byBoYW5nIHdoaWxlIHdhaXRpbmcKPiA+IGZvciB0aGUgdGltZW91dC4KPgo+
IElzIHRoZXJlIHNvbWUgd2F5IGZvciB1c2VycyB0byBmaWd1cmUgb3V0IHRoYXQgdGhleSB3b3Vs
ZCBuZWVkIHRoaXMKPiBwcm9wZXJ0eT8gIE9yIGlzIGl0IGp1c3QgImlmIHlvdXIga2VybmVsIHBh
bmljcyBvbiBib290LCB0cnkKPiBhZGRpbmcgb3IgaW5jcmVhc2luZyAiYnVzLXNjYW4tZGVsYXkt
bXMiIGluIHlvdXIgRFQ/CgpUaGVyZSdzIGEgbGlzdGluZyBvZiB0ZXN0ZWQgY2FyZHMgYXQ6Cmh0
dHBzOi8vd2lraS5waW5lNjQub3JnL3dpa2kvUk9DS1BybzY0X0hhcmR3YXJlX2NvbXBhdGliaWxp
dHkKCk1vc3QgY2FyZHMgd29yayBmaW5lIHRoYXQgZG9uJ3QgcmVxdWlyZSBhIGxhcmdlIEJBUi4g
UENJZSBzd2l0Y2hlcyBhcmUKY29tcGxldGVseSBkZWFkIHdpdGhvdXQgdGhlIGFib3ZlIGhhY2sg
cGF0Y2guIENhcmRzIHRoYXQgbGllIGluIHRoZQptaWRkbGUgYXJlIG9uZXMgdGhhdCBleHBlY3Qg
QklPUyAvIEVGSSBzdXBwb3J0IHRvIGluaXRpYWxpemUsIG9yIG9uZXMKdGhhdCBoYXZlIGNvbXBs
ZXggYm9vdCByb21zIGFuZCBkb24ndCBpbml0aWFsaXplIHF1aWNrbHkuCkJ1dCB5ZXMsIGl0J3Mg
dW5mb3J0dW5hdGVseSBnb2luZyB0byBiZSAiaWYgeW91IHBhbmljLCBpbmNyZWFzZSB0aGUKZGVs
YXkiIHVubGVzcyBhIG1vcmUgY29tcGxldGUgZGF0YWJhc2Ugb2YgY2FyZHMgY2FuIGJlIGdlbmVy
YXRlZC4KClZlcnkgUmVzcGVjdGZ1bGx5LApQZXRlciBHZWlzCgo+Cj4gQmpvcm4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRl
ZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgta2VybmVsLW1lbnRlZXMK
