Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2F8C55179
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 10:12:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19D182242E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 10:12:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QejaOMm4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19D182242E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7023C85F3E;
	Tue,  3 Nov 2020 10:12:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id etOuGrs61Ya1; Tue,  3 Nov 2020 10:12:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A6FB685F32;
	Tue,  3 Nov 2020 10:12:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CD08C0889;
	Tue,  3 Nov 2020 10:12:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2141BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 10:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0F83F86CF9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 10:12:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n8xhiVp7c+FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 10:12:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 11FBE86A91
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 10:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604398334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0MUFWE6mOnbnRG+Ni8WIQ3yfgCYil12Q6u/TIezmtsg=;
 b=QejaOMm4EybvnklJeqfERyblCev7vMR4rF+Mm7I10b8eVzh2sdONp5yXgBgrsIVTMYI/DQ
 c8J66MX9Sby+5nAk9urf7mjiAlvk8q2aHeFD3CEwaZlpy6vspT38r4B5h0aojAce5aMV/+
 GyggGCKTxI31Srlyd9DToP+fGEDuc6g=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-mZKhI_5oOqGGzINff0bQyw-1; Tue, 03 Nov 2020 05:12:12 -0500
X-MC-Unique: mZKhI_5oOqGGzINff0bQyw-1
Received: by mail-ej1-f70.google.com with SMTP id p19so5199990ejy.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 02:12:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0MUFWE6mOnbnRG+Ni8WIQ3yfgCYil12Q6u/TIezmtsg=;
 b=pn4t07tlpCr7N07LTLWfcLmusS5Q713/eOJuOlkBsDBFqbB26Hs72HMlEBdzXnWR4G
 jwxSOtpS5mdQRY5hTv/RPCB3dDzDk9eZ9Rkf/yO5BdykhALOn1BiluhZ7ZTkUhPxf/+n
 o8Jy9MHvZemr91atUeMn7cHIMR9EUpO+A/e9GhZgVYMvxeyhBFd2YP02/TGCbL6RB04M
 wRymrIcpgSdvX8y9n+V2jGC+qWKnJe2WET9OGReP4FlZVnzFj/GjA7EQIfMLoOu9+WbD
 N70se9VYcL0MEoI4XdA4MWYlZEXJBWUKJc6eLsncOqHL/810l8xQIJZS0J3M7u9lM3+o
 Gn+w==
X-Gm-Message-State: AOAM533GlMoQj4DOmLx6j3sZn8TmtdTTX2+gtlahq0f3K+dq5RsnraGT
 wC6k2e55spSwFXy4NMGJdtAwW7KcGiQCbLkOXni3oQb+62E0ywPx6fjfN4VJBT3CI1Ke1bKmc+2
 x2qyCEV6yJF7Kc6+zrynSMPFPOWNLTIVZz52jtG0XCgT7Bexv
X-Received: by 2002:aa7:d709:: with SMTP id t9mr6130968edq.305.1604398330688; 
 Tue, 03 Nov 2020 02:12:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypkhXwlBVdPP8Nwx/U9egOi9INTITIlOwLSF0+H3rc3ojEQIsQTVaupr2QiIMSubSp0nl6kw==
X-Received: by 2002:aa7:d709:: with SMTP id t9mr6130944edq.305.1604398330401; 
 Tue, 03 Nov 2020 02:12:10 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
 by smtp.gmail.com with ESMTPSA id hj13sm698941ejb.125.2020.11.03.02.12.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 02:12:09 -0800 (PST)
To: Coiby Xu <coiby.xu@gmail.com>
References: <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
 <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk>
 <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk>
 <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
 <20201103000507.ufzukd2vkb5h2e3b@Rk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <2f4706a1-502f-75f0-9596-cc25b4933b6c@redhat.com>
Date: Tue, 3 Nov 2020 11:12:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201103000507.ufzukd2vkb5h2e3b@Rk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>, wang jun <availa@outlook.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Nehal Shah <Nehal-bakulchandra.Shah@amd.com>
Subject: Re: [Linux-kernel-mentees] Any other ways to debug GPIO interrupt
 controller (pinctrl-amd) for broken touchpads of a new laptop model?
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

SGksCgpPbiAxMS8zLzIwIDE6MDUgQU0sIENvaWJ5IFh1IHdyb3RlOgo+IE9uIFR1ZSwgT2N0IDI3
LCAyMDIwIGF0IDExOjA5OjExQU0gKzAxMDAsIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4+IEhpLAo+
Pgo+IC4uLgo+Pgo+PiBTbyBJIHNlZSAyIHdheXMgdG8gbW92ZSBmb3J3YXJkIHdpdGggaGlzOgo+
Pgo+PiAxLiBKdXN0IGRpc2FibGUgdGhlIGRlYm91bmNlIGZpbHRlciBmb3IgbGV2ZWwgdHlwZSBJ
UlFzOyBvcgo+PiAyLiBBZGQgYSBoZWxwZXIgdG8gc2FuaXRpemUgdGhlIGRlYm91bmNlIHB1bHNl
LWR1cmF0aW9uIHNldHRpbmcgYW5kCj4+IMKgIGNhbGwgdGhhdCB3aGVuIHNldHRpbmcgdGhlIElS
USB0eXBlLgo+PiDCoCBUaGlzIGhlbHBlciB3b3VsZCByZWFkIHRoZSBzZXR0aW5nIGNoZWNrIGl0
IGlzIG5vdCBjcmF6eSBsb25nIGZvcgo+PiDCoCBhbiBJUlEtbGluZSAobGV0cyBzYXkgYW55dGhp
bmcgYWJvdmUgMSBtcyBpcyBjcmF6eSBsb25nKSBhbmQgaWYgaXQKPj4gwqAgaXMgY3JhenkgbG9u
ZyB0aGVuIG92ZXJ3cml0ZSBpdCB3aXRoIGEgc2FuZXIgdmFsdWUuCj4+Cj4+IDIuIGlzIGEgYml0
IHRyaWNreSwgYmVjYXVzZSBpZiB0aGUgSVJRIGxpbmUgY29tZXMgZnJvbSBhIGNoaXAgdGhlbgo+
PiBvYnZpb3VzbHkgbWF4IDFtcyBkZWJvdW5jaW5nIHRvIGNhdGNoIGVsZXRyaWNhbCBpbnRlcmZl
cmVuY2Ugc2hvdWxkIGJlCj4+IGZpbmUuIEJ1dCBzb21ldGltZXMgY2hlYXAgYnV0dG9ucyBmb3Ig
dGhpbmdzIGxpa2Ugdm9sdW1lIHVwL2Rvd24gb24gdGFibGV0cwo+PiBhcmUgZGlyZWN0bHkgY29u
bmVjdGVkIHRvIEdQSU9zIGFuZCB0aGVuIHdlIG1heSB3YW50IGxvbmdlciBkZWJvdW5jaW5nLi4u
Cj4+Cj4+IFNvIGlmIHdlIGRvIDIuIHdlIG1heSB3YW50IHRvIGxpbWl0IGl0IHRvIG9ubHkgbGV2
ZWwgdHlwZSBJUlFzIHRvby4KPj4KPj4gTm90ZSBJIGhhdmUgY29udGFjdGVkIEFNRCBhYm91dCB0
aGlzIGFuZCBhc2tlZCB0aGVtIGZvciBzb21lIGlucHV0IG9uIHRoaXMsCj4+IGlkZWFsbHkgdGhl
eSBjYW4gdGVsbCB1cyBob3cgZXhhY3RseSB3ZSBzaG91bGQgcHJvZ3JhbSB0aGUgZGVib3VuY2Ug
ZmlsdGVyCj4+IGFuZCBiYXNlZCBvbiB3aGljaCBkYXRhIHdlIHNob3VsZCBkbyB0aGF0Lgo+IAo+
IElzIHRoZXJlIGFueSB1cGRhdGUgZnJvbSBBTUQ/CgpJJ20gYWZyYWlkIG5vdC4KCj4gQmFzZWQg
b24gdGhlIGRpc2N1c3Npb24sIEknbSBnb2luZyB0bwo+IHN1Ym1pdCBhIHBhdGNoIHRvIGRpc2Fi
bGUgZGVib3VuY2UgZmlsdGVyIGZvciBib3RoIGxldmVsIGFuZCBlZGdlCj4gdHlwZSBJUlFzLCBp
LmUuIHRvIHJlbW92ZSByZWxldmFudCBjb2RlIGluIGFtZF9ncGlvX2lycV9zZXRfdHlwZSBvZgo+
IGRyaXZlcnMvcGluY3RybC9waW5jdHJsLWFtZC5jIHNpbmNlIHNldHRpbmcgZGVib3VuY2UgZmls
dGVyIGlzCj4gb3J0aG9nb25hbCB0byBzZXR0aW5nIGlycSB0eXBlIGFuZCBBbmR5IGhhcyBzdWJt
aXR0ZWQgdGhlIHBhdGNoIHRvCj4gc3VwcG9ydCBzZXR0aW5nIGRlYm91bmNlIHNldHRpbmcgc3Vw
cGxpZWQgYnkgQUNQSSBpbiBncGlvbGliLWFjcGkuYwoKT2suCgo+IEJ0dywgZGlkIHlvdSBjb250
YWN0IEFNRCB0aHJvdWdoIGEgcmVwcmVzZW50YXRpdmU/CgpZZXMgSSdtIHVzaW5nIFJlZCBIYXQn
cyBjb250YWN0cyBpbiB0byBBTUQncyBzZXJ2ZXIgZGVwYXJ0bWVudCwKd2hpY2ggYXJlIHB1dHRp
bmcgbWUgaW4gY29udGFjdCB3aXRoIEFNRCdzZSBjbGllbnQgZGVwYXJ0bWVudC4KCj4gT2J2aW91
c2x5IENDIHRoZW0KPiBkaWRuJ3QgZ2V0IHRoZWlyIGF0dGVudGlvbi4gVGhlcmUgaXMgYW4gaW5j
b25zaXN0ZW5jeSBmb3IgY29uZmlndXJpbmcKPiBkZWJvdW5jZSB0aW1lb3V0IGluIHBpbmN0cmwt
YW1kIGFzIHdhcyBzcG90dGVkIGJ5IEFuZHkgWzFdLiBJIGFsc28gbmVlZAo+IHRoZWlyIGZlZWRi
YWNrIGZvciB0aGlzIG1hdHRlci4KPiAKPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0
Y2h3b3JrL2NvbW1lbnQvMTUyMjY3NS8KClRoaXMgaXMgYSBjYXNlIHdoZXJlIEFuZHkgaXMgb2J2
aW91c2x5IHJpZ2h0IGFuZCB5b3Ugc2hvdWxkIGp1c3QgdXNlIHRoZQpoaWdoZXIgcHJlY2lzaW9u
ICJ1bml0ID0gMTU2MjUiIHZhbHVlIChleGNlcHQgcHJvYmFibHkgdGhhdCBpcyB3cm9uZyB0b28s
CnNlZSBiZWxvdykuCgpXZSBoYXZlIGhhZCBzaW1pbGFyIGlzc3VlcyB3aXRoIHRoZSBkb2NzIGZv
ciBnZXR0aW5nIHRoZSBUU0MgZnJlcXVlbmN5Cm9uIHNvbWUgSW50ZWwgY2hpcHMsIHdoZXJlIHRo
ZSBkb2NzIHNhaWQgMTYuNiBNSHogZm9yIGEgY2VydGFpbiByZWdpc3Rlcgp2YWx1ZSwgd2hlcmUg
d2hhdCB0aGV5IG1lYW50IHdhcyAxMDAvNiBNSHogd2hpY2ggcmVhbGx5IGlzIHNpZ25pZmljYW50
bHkKZGlmZmVyZW50LiBUaGlzIHdhcyBsZWFkaW5nIHRvIGEgdGltZSBkcmlmdCBvZiA1IG1pbnV0
ZXMgLyBkYXkgb24gbm9uCm5ldHdvcmtlZCAoc28gbm8gTlRQKSBMaW51eCBzeXN0ZW1zLgoKSSB0
aGluayB0aGlzIGlzIHdoYXQgQW5keSB3YXMgcmVmZXJyaW5nIHRvIHdoZW4gaGUgd3JvdGU6CiJX
aGF0IHRoZSBoZWNrIHdpdGggSFcgY29tcGFuaWVzISAoSnVzdCBhbiBlbW90aW9uIGJhc2VkIG9u
IHRoZSBleHBlcmllbmNlKSIKClNvIHRoZSBsZXNzb24gbGVhcm5lZCB0aGVyZSBpcyB3aGVuIHlv
dSBjYW4gYmUgcmVhc29uYWJsZSBjZXJ0YWluIHRoYXQKdGhlIHZhbHVlIHJlYWxseSBpcyBhL2Ig
YW5kIHRoZSByZXN1bHRpbmcgZGlnaXRzIG9mIHRoZSB2YWx1ZSBpbiB0aGUKaHcgZG9jIG1hdGNo
IHRoYXQgdGFraW5nIHRoZSBsb3VzeSBwcmVjaXNpb24gaW50byBhY2NvdW50IHRoZW4geW91CnNo
b3VsZCBwcm9iYWJseSBhc3N1bWUgdGhlIHZhbHVlIHJlYWxseSBpcyBhL2IgYW5kIG5vdCB0aGUg
bG91c3kKcHJlY2lzaW9uIHZhbHVlIGdpdmVuIGluIHRoZSBkb2NzIChvciB0aGUgY29kZSBjb21t
ZW50IGluIHRoaXMgY2FzZSkuCgpJIG1lYW4gMTUuNiBtc2VjIGhhcyAzIHNpZ25pZmljYW50IG51
bWJlcnMsIHRoYXQgZ2l2ZXMgYW4gaW1wcmVjaXNpb24gLwplcnJvciBvZiBhcHByb3guIDEwMDAg
cHBtIHdoZXJlIGFzIGEgZGVjZW50IGNsb2NrIGNyeXN0YWwgaXMgaW4gdGhlIG9yZGVyCm9mIDUw
IHBwbSwgc28gdGhlIGhhcmR3YXJlIGhhcyBhIGRyaWZ0IC8gZXJyb3Igb2YgYXBwcm94LiA1MCBw
cG0gd2hpY2gKbWFrZXMgdXNpbmcgYSB2YWx1ZSB3aXRoIGFuIGVycm9yIG9mIDEwMDAgcHBtIGlu
IHRoZSBjb2RlIHJlYWxseSByZWFsbHkKYmFkLgoKQWN0dWFsbHkgYWxsIHRoZSB2YWx1ZXMgbG9v
ayBzb21ld2hhdCBzdXNwZWN0LiBUaGUgY29tbWVudDoKCj4gICAgICAgICAgICAgICAgIERlYm91
bmNlICAgICAgICBEZWJvdW5jZSAgICAgICAgVGltZXIgICBNYXgKPiAgICAgICAgICAgICAgICAg
VG1yTGFyZ2UgICAgICAgIFRtck91dFVuaXQgICAgICBVbml0ICAgIERlYm91bmNlCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUaW1lCj4g
ICAgICAgICAgICAgICAgIDAgICAgICAgMCAgICAgICA2MSB1c2VjICgyIFJ0Y0NsaykgICAgICA5
NzYgdXNlYwo+ICAgICAgICAgICAgICAgICAwICAgICAgIDEgICAgICAgMjQ0IHVzZWMgKDggUnRj
Q2xrKSAgICAgMy45IG1zZWMKPiAgICAgICAgICAgICAgICAgMSAgICAgICAwICAgICAgIDE1LjYg
bXNlYyAoNTEyIFJ0Y0NsaykgIDI1MCBtc2VjCj4gICAgICAgICAgICAgICAgIDEgICAgICAgMSAg
ICAgICA2Mi41IG1zZWMgKDIwNDggUnRjQ2xrKSAxIHNlYwoKSGVscGZ1bGx5IGdpdmVzIHRoZSB2
YWx1ZXMgaW4gUnRjQ2xrcy4gQSB0eXBpY2FsIFJUQyBjbG9jayBjcnlzdGFsCmlzIDMyIEtIeiB3
aGljaCBnaXZlcyB1cyAzMS4yNSB1c2VjIHBlciB0aWNrLCBzbyBJIHdvdWxkIGV4cGVjdCB0aGUK
dmFsdWVzIHRvIGJlOgoKICAgICAgICAgICAgICAgICAwICAgICAgIDAgICAgICAgNjIuNTAwIHVz
ZWMgKDIgUnRjQ2xrKSAgICAgIAogICAgICAgICAgICAgICAgIDAgICAgICAgMSAgICAgICAyNTAu
MDAgdXNlYyAoOCBSdGNDbGspICAgIAogICAgICAgICAgICAgICAgIDEgICAgICAgMCAgICAgICAx
Ni4wMDAgbXNlYyAoNTEyIFJ0Y0NsaykgCiAgICAgICAgICAgICAgICAgMSAgICAgICAxICAgICAg
IDY0LjAwMCBtc2VjICgyMDQ4IFJ0Y0NsaykKCkFuZCB0aGUgbWF4IG11bHRpcGxpZXIgc2VlbXMg
dG8gYmUgMTUsIG5vdCAxNiBhcyBpcyB1c2VkIGZvciB0aGUKTWF4IERlYm91bmNlIFRpbWUncyBp
biB0aGUgY29tbWVudCwgc28gdGhvc2UgYXJlIHdyb25nIHRvby4gSSBoYXZlCmEgZmVlbGluZyB0
aGUgdGFibGUgd2FzIGJ1aWxkIHRoZSB3cm9uZyB3YXkgYXJvdW5kIChtaW51cyB0aGUKUnRjQ2xr
IHBhcnRzKS4gVGhleSBzdGFydGVkIHdpdGggYSBNYXggRGVib3VuY2UgVGltZSBvZiAxIHNlYywg
dGhlbgpkaXZpZGVkIHRoYXQgYnkgMTYgZ2l2ZW4gdGhlbSA2Mi41IG1zZWMsIHdoZXJlIGFzIGlu
IHJlYWxpdHkKd2UgaGF2ZSAyMDQ4IHRpY2tzIG9mIGEgMzIgS0h6IGNsb2NrIGdpdmluZyB1cyA2
NCBtaWxsaXNlYywgZXRjLgoKSSBhbHNvIHdvbmRlciBpZiB0aGUgMC0xNSBkaXZpZGVyIHJlYWxs
eSBpcyBhIDAtMTUgZGl2aWRlciBvciBhCjEtMTYgZGl2aWRlci4uLiBUaGlzIHN1Z2dlc3RzOgoK
ICAgICAgICAgICAgICAgIGlmIChkZWJvdW5jZSA8IDYxKSB7CiAgICAgICAgICAgICAgICAgICAg
ICAgIHBpbl9yZWcgfD0gMTsKCkl0IHJlYWxseSBpcyBhIDAtMTUgZGl2aWRlciwgc28gd2l0aG91
dCBkb2NzIHdlIHNob3VsZCBqdXN0IGFzc3VtZQp0aGF0IGl0IGlzIDAtMTUgZm9yIG5vdywgd2hp
Y2ggbWFrZXMgdGhlIGRpdmlkZSAxIHNlY29uZCBieSAxNiB0aGluZwp3aGljaCBnb3QgdGhlbSA2
Mi41IG1zZWMgKG9yIHNvIEkgYmVsaWV2ZSkgYSBiaXQgc3VzcGVjdC4gRWl0aGVyIHRoZQpkaXZp
ZGUgYnkgMTYgaXMgd3JvbmcsIG9yIHRoZSBkaXZpZGVyIHJlYWxseSBpcyBhIDEtMTYgZGl2aWRl
ci4uLgoKUmVnYXJkcywKCkhhbnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJu
ZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
