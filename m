Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B4ACDB483
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 14 Oct 2023 09:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D4734050C;
	Sat, 14 Oct 2023 09:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D4734050C
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Exx1S0w0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cTXi79KEc0-F; Sat, 14 Oct 2023 09:02:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C2F83400C1;
	Sat, 14 Oct 2023 09:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2F83400C1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98D42C0039;
	Sat, 14 Oct 2023 09:02:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5456EC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Oct 2023 09:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BD2260F5E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Oct 2023 09:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BD2260F5E
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=Exx1S0w0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HcwAwX3p9HpX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Oct 2023 09:02:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D292F60F56
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Oct 2023 09:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D292F60F56
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 07B6560A54
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Oct 2023 09:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9838FC433C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Oct 2023 09:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697274143;
 bh=q3aIQAuGvEalvJHYNryE3fePayWggV6Dn+qBeFX+34s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Exx1S0w0PeoIpe/84fDYaVqKop1vQLJ2EaJFIBQLpyxL7mgHxSMTP3C+m11eghqg3
 TUORXEG9dLnXoFfKsP67ypqtX6RXv2Ps80ICQCQcp5Z0vThHIjK9k65TC42ijalPuV
 9ryvYIG415hvZTwV1XeMiBLL8Qu9MUPItpwLeNfzWVft3ftaJ6yAUjHh0G7e9SoCsC
 wVtQfM+uEUBuVw6KB8n9S7bgBRQUdQ4636uwjbA+NfQmKmPF1DclMHTUbZF9iRAZ8o
 RsXft9S2BOJAhdmkJZOjxZR1LhzUI0ZScs7Fi2ObH2PXUUni0k8MeG29UpI8tpuxmS
 WcPoN6LQemDvQ==
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-1e98e97c824so1966890fac.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Oct 2023 02:02:23 -0700 (PDT)
X-Gm-Message-State: AOJu0YxajJcWZUr9DYk3n1qMj59jtmtq31yt/fXmlsCtrMCTVGXmL24K
 yumrnTpPVDOylGepT8eNaOdbPj8Tor+jAi54h/4=
X-Google-Smtp-Source: AGHT+IHqWtE8o7PhfqWEFTDLju6aH2tyNyhvJWyLTtp4uE/cubOMSAd8e6I4cAdTjpAJSKQxpxsIPgdtzLoUTdjg4sQ=
X-Received: by 2002:a05:6870:c081:b0:1dc:dcf9:18d8 with SMTP id
 c1-20020a056870c08100b001dcdcf918d8mr1423504oad.24.1697274142906; Sat, 14 Oct
 2023 02:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231012105420.16779-2-ricardo@marliere.net>
In-Reply-To: <20231012105420.16779-2-ricardo@marliere.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 14 Oct 2023 18:01:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNATgyPVNk=5mq9D_4Hg3GTesDEwB=XKDUVXdjUintwWenA@mail.gmail.com>
Message-ID: <CAK7LNATgyPVNk=5mq9D_4Hg3GTesDEwB=XKDUVXdjUintwWenA@mail.gmail.com>
Subject: Re: [PATCH] docs: kbuild: add INSTALL_DTBS_PATH
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Nicolas Schier <nicolas@fjasle.eu>,
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

T24gVGh1LCBPY3QgMTIsIDIwMjMgYXQgNzo1NuKAr1BNIFJpY2FyZG8gQi4gTWFybGllcmUKPHJp
Y2FyZG9AbWFybGllcmUubmV0PiB3cm90ZToKPgo+IFRoZSBkb2N1bWVudGF0aW9uIGZvciBrYnVp
bGQgYW5kIG1ha2VmaWxlcyBpcyBtaXNzaW5nIGFuIGV4cGxhbmF0aW9uIG9mCj4gYSB2YXJpYWJs
ZSBpbXBvcnRhbnQgZm9yIHNvbWUgYXJjaGl0ZWN0dXJlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFJp
Y2FyZG8gQi4gTWFybGllcmUgPHJpY2FyZG9AbWFybGllcmUubmV0Pgo+IC0tLQoKQXBwbGllZCB0
byBsaW51eC1rYnVpbGQuClRoYW5rcy4KCgo+ICBEb2N1bWVudGF0aW9uL2tidWlsZC9rYnVpbGQu
cnN0ICAgIHwgNiArKysrKysKPiAgRG9jdW1lbnRhdGlvbi9rYnVpbGQvbWFrZWZpbGVzLnJzdCB8
IDcgKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2tidWlsZC9rYnVpbGQucnN0IGIvRG9jdW1lbnRhdGlvbi9r
YnVpbGQva2J1aWxkLnJzdAo+IGluZGV4IGJkOTA2NDA3ZTMwNy4uOWM4ZDFkMDQ2ZWE1IDEwMDY0
NAo+IC0tLSBhL0RvY3VtZW50YXRpb24va2J1aWxkL2tidWlsZC5yc3QKPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2tidWlsZC9rYnVpbGQucnN0Cj4gQEAgLTI0Myw2ICsyNDMsMTIgQEAgVGhlIG91dHB1
dCBkaXJlY3RvcnkgaXMgb2Z0ZW4gc2V0IHVzaW5nICJPPS4uLiIgb24gdGhlIGNvbW1hbmRsaW5l
Lgo+Cj4gIFRoZSB2YWx1ZSBjYW4gYmUgb3ZlcnJpZGRlbiBpbiB3aGljaCBjYXNlIHRoZSBkZWZh
dWx0IHZhbHVlIGlzIGlnbm9yZWQuCj4KPiArSU5TVEFMTF9EVEJTX1BBVEgKPiArLS0tLS0tLS0t
LS0tLS0tLS0KPiArSU5TVEFMTF9EVEJTX1BBVEggc3BlY2lmaWVzIHdoZXJlIHRvIGluc3RhbGwg
ZGV2aWNlIHRyZWUgYmxvYnMgZm9yCj4gK3JlbG9jYXRpb25zIHJlcXVpcmVkIGJ5IGJ1aWxkIHJv
b3RzLiAgVGhpcyBpcyBub3QgZGVmaW5lZCBpbiB0aGUKPiArbWFrZWZpbGUgYnV0IHRoZSBhcmd1
bWVudCBjYW4gYmUgcGFzc2VkIHRvIG1ha2UgaWYgbmVlZGVkLgo+ICsKPiAgS0JVSUxEX0FCU19T
UkNUUkVFCj4gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gIEtidWlsZCB1c2VzIGEgcmVsYXRpdmUgcGF0aCB0byBwb2ludCB0byB0aGUgdHJlZSB3
aGVuIHBvc3NpYmxlLiBGb3IgaW5zdGFuY2UsCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
a2J1aWxkL21ha2VmaWxlcy5yc3QgYi9Eb2N1bWVudGF0aW9uL2tidWlsZC9tYWtlZmlsZXMucnN0
Cj4gaW5kZXggZTY3ZWIyNjFjOWIwLi5kODhkNGYwZjRmODkgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9rYnVpbGQvbWFrZWZpbGVzLnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24va2J1aWxk
L21ha2VmaWxlcy5yc3QKPiBAQCAtMTYyMyw2ICsxNjIzLDEzIEBAIElOU1RBTExfTU9EX1NUUklQ
Cj4gICAgSU5TVEFMTF9NT0RfU1RSSVAgdmFsdWUgd2lsbCBiZSB1c2VkIGFzIHRoZSBvcHRpb24o
cykgdG8gdGhlIHN0cmlwCj4gICAgY29tbWFuZC4KPgo+ICtJTlNUQUxMX0RUQlNfUEFUSAo+ICsg
IFRoaXMgdmFyaWFibGUgc3BlY2lmaWVzIGEgcHJlZml4IGZvciByZWxvY2F0aW9ucyByZXF1aXJl
ZCBieSBidWlsZAo+ICsgIHJvb3RzLiBJdCBkZWZpbmVzIGEgcGxhY2UgZm9yIGluc3RhbGxpbmcg
dGhlIGRldmljZSB0cmVlIGJsb2JzLiBMaWtlCj4gKyAgSU5TVEFMTF9NT0RfUEFUSCwgaXQgaXNu
J3QgZGVmaW5lZCBpbiB0aGUgTWFrZWZpbGUsIGJ1dCBjYW4gYmUgcGFzc2VkCj4gKyAgYnkgdGhl
IHVzZXIgaWYgZGVzaXJlZC4gT3RoZXJ3aXNlIGl0IGRlZmF1bHRzIHRvIHRoZSBrZXJuZWwgaW5z
dGFsbAo+ICsgIHBhdGguCj4gKwo+ICBNYWtlZmlsZSBsYW5ndWFnZQo+ICA9PT09PT09PT09PT09
PT09PQo+Cj4gLS0KPiAyLjQyLjAKPgoKCi0tIApCZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFtYWRh
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtl
cm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51
eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
