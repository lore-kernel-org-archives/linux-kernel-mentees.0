Return-Path: <SRS0=z0fH=5Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4273C43331
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Mar 2020 20:02:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADCC020787
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Mar 2020 20:02:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="qjEIqcXD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADCC020787
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B938B86D80;
	Tue, 31 Mar 2020 20:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nc5GJl1umYsC; Tue, 31 Mar 2020 20:02:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EB9F786D77;
	Tue, 31 Mar 2020 20:02:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC6D6C1AE8;
	Tue, 31 Mar 2020 20:02:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B76DC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 20:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4C2558891C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 20:02:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BeEAbiP6bqU8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 20:02:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 367DC8891A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 20:02:21 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id c145so24466903qke.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 13:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Q1beehtgWdVUjw4H/uaMAEYCwGvvcPji2ivitcnMva8=;
 b=qjEIqcXDFFQ1IVgRToaVEFyL+0yx+IHNvMfCjj1ZHcVpXyMqr/hcYS1hfnj2uVmjjv
 yF+qKqa9VvvPLCcwZ56GYq/5cMJwhVKSopJqHOxjo73zWwQET2IZ1Su5NLgv13G4oqcu
 Ho1jOsFYGPvNGoCteEmV1OxTymHbHz3pKZpamIUnpEWAE3tESP4ValkKap8szgNtnVE2
 L8euZT+pZ0CrVfRxjtsB1gSE9AT1NNvn0cxK9xffq358Uh1tM05ZO05zgGNOTqyTQeEP
 yTQPBU7ZfTLZBByEWwAdXwumthwfQIde9hm4L9IiAIGIfjzJOTbu6QVTDkyr+W4SoeDV
 gaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Q1beehtgWdVUjw4H/uaMAEYCwGvvcPji2ivitcnMva8=;
 b=oet8a5mMJs6hZ3O7LbKyQ3bNl+xZ/j0hrb2TUrEtiZW/ew14NPXEeJMc0hF59TRT+I
 Xl+ViMkFMIyvvc4zNSbJoxk2Crs3UsAfHD5L3wBjIcaGwtigOo1CjXt6lirKe4BglKYH
 +QmdhY5THJlwJwPkMYO2H/jSsCo0HUJCKYIzddiLnUoAlVyAlgq50kEdVPiLoPyCv6i/
 Kd3TtvG/ndb4arVgXHLWbY454K/DR6y6io8OY9eZOPSJ7f8w39ZyZ/JNd+q3gLCMMDdL
 v5u0qsy6bYGfT+icfXbZmFKXm0K/KRA05dJNwdznZjyCM2Sdc0+IvTODjRRdacUOwes9
 aMHA==
X-Gm-Message-State: ANhLgQ2xdtacIsd9xqGeFomKGLTfDrtN98Hqd11r5T7H1k0vpYFyVID2
 9W5JwZ8/MUAiO3TIYcJtmiIw4w==
X-Google-Smtp-Source: ADFU+vti1QMwOqAdl+gaxBXKBzLkewg0+Axr05e9r2mxkQ8EUGr/8S/DnP48kOLNivRmNJ7kFTFSGQ==
X-Received: by 2002:a37:61d0:: with SMTP id v199mr6669980qkb.292.1585684939953; 
 Tue, 31 Mar 2020 13:02:19 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id t43sm14488528qtc.14.2020.03.31.13.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 13:02:19 -0700 (PDT)
Message-ID: <953a450cf58e2a459f7a09267cbbbcd38e5cc6bc.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-kernel@vger.kernel.org
Date: Tue, 31 Mar 2020 17:02:14 -0300
In-Reply-To: <20200331085308.098696461@linuxfoundation.org>
References: <20200331085308.098696461@linuxfoundation.org>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: ben.hutchings@codethink.co.uk, torvalds@linux-foundation.org,
 patches@kernelci.org, lkft-triage@lists.linaro.org, stable@vger.kernel.org,
 akpm@linux-foundation.org, shuah@kernel.org, linux@roeck-us.net,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: Re: [Linux-kernel-mentees] [PATCH 5.6 00/23] 5.6.1-rc1 review
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

T24gVHVlLCAyMDIwLTAzLTMxIGF0IDEwOjU5ICswMjAwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3Jv
dGU6Cj4gVGhpcyBpcyB0aGUgc3RhcnQgb2YgdGhlIHN0YWJsZSByZXZpZXcgY3ljbGUgZm9yIHRo
ZSA1LjYuMSByZWxlYXNlLgo+IFRoZXJlIGFyZSAyMyBwYXRjaGVzIGluIHRoaXMgc2VyaWVzLCBh
bGwgd2lsbCBiZSBwb3N0ZWQgYXMgYSByZXNwb25zZQo+IHRvIHRoaXMgb25lLiAgSWYgYW55b25l
IGhhcyBhbnkgaXNzdWVzIHdpdGggdGhlc2UgYmVpbmcgYXBwbGllZCwKPiBwbGVhc2UKPiBsZXQg
bWUga25vdy4KPiAKPiBSZXNwb25zZXMgc2hvdWxkIGJlIG1hZGUgYnkgVGh1LCAwMiBBcHIgMjAy
MCAwODo1MDozNyArMDAwMC4KPiBBbnl0aGluZyByZWNlaXZlZCBhZnRlciB0aGF0IHRpbWUgbWln
aHQgYmUgdG9vIGxhdGUuCj4gCj4gVGhlIHdob2xlIHBhdGNoIHNlcmllcyBjYW4gYmUgZm91bmQg
aW4gb25lIHBhdGNoIGF0Ogo+IAkKPiBodHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC9r
ZXJuZWwvdjUueC9zdGFibGUtcmV2aWV3L3BhdGNoLTUuNi4xLXJjMS5nego+IG9yIGluIHRoZSBn
aXQgdHJlZSBhbmQgYnJhbmNoIGF0Ogo+IAlnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LQo+IHN0YWJsZS1yYy5naXQgbGludXgtNS42LnkK
PiBhbmQgdGhlIGRpZmZzdGF0IGNhbiBiZSBmb3VuZCBiZWxvdy4KPiAKPiB0aGFua3MsCj4gCj4g
Z3JlZyBrLWgKPiAKPiAtLS0tLS0tLS0tLS0tCj4gUHNldWRvLVNob3J0bG9nIG9mIGNvbW1pdHM6
Cj4gCj4gR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiAg
ICAgTGludXggNS42LjEtcmMxCj4gCj4gRGFmbmEgSGlyc2NoZmVsZCA8ZGFmbmEuaGlyc2NoZmVs
ZEBjb2xsYWJvcmEuY29tPgo+ICAgICBtZWRpYTogdjRsMi1jb3JlOiBmaXggYSB1c2UtYWZ0ZXIt
ZnJlZSBidWcgb2Ygc2QtPmRldm5vZGUKPiAKPiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5v
cmc+Cj4gICAgIG1lZGlhOiB4aXJsaW5rX2NpdDogYWRkIG1pc3NpbmcgZGVzY3JpcHRvciBzYW5p
dHkgY2hlY2tzCj4gCj4gSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgo+ICAgICBtZWRp
YTogc3R2MDZ4eDogYWRkIG1pc3NpbmcgZGVzY3JpcHRvciBzYW5pdHkgY2hlY2tzCj4gCj4gSm9o
YW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgo+ICAgICBtZWRpYTogZGliMDcwMDogZml4IHJj
IGVuZHBvaW50IGxvb2t1cAo+IAo+IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KPiAg
ICAgbWVkaWE6IG92NTE5OiBhZGQgbWlzc2luZyBlbmRwb2ludCBzYW5pdHkgY2hlY2tzCj4gCj4g
RXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0Bnb29nbGUuY29tPgo+ICAgICBsaWJmczogZml4IGluZm9s
ZWFrIGluIHNpbXBsZV9hdHRyX3JlYWQoKQo+IAo+IEthaS1IZW5nIEZlbmcgPGthaS5oZW5nLmZl
bmdAY2Fub25pY2FsLmNvbT4KPiAgICAgYWhjaTogQWRkIEludGVsIENvbWV0IExha2UgSCBSQUlE
IFBDSSBJRAo+IAo+IE1pY2hhxYIgTWlyb3PFgmF3IDxtaXJxLWxpbnV4QHJlcmUucW1xbS5wbD4K
PiAgICAgc3RhZ2luZzogd2Z4OiBhbm5vdGF0ZSBuZXN0ZWQgZ2NfbGlzdCB2cyB0eCBxdWV1ZSBs
b2NraW5nCj4gCj4gTWljaGHFgiBNaXJvc8WCYXcgPG1pcnEtbGludXhAcmVyZS5xbXFtLnBsPgo+
ICAgICBzdGFnaW5nOiB3Zng6IGZpeCBpbml0L3JlbW92ZSB2cyBJUlEgcmFjZQo+IAo+IE1pY2hh
xYIgTWlyb3PFgmF3IDxtaXJxLWxpbnV4QHJlcmUucW1xbS5wbD4KPiAgICAgc3RhZ2luZzogd2Z4
OiBhZGQgcHJvcGVyICJjb21wYXRpYmxlIiBzdHJpbmcKPiAKPiBRaXVqdW4gSHVhbmcgPGhxamFn
YWluQGdtYWlsLmNvbT4KPiAgICAgc3RhZ2luZzogd2xhbi1uZzogZml4IHVzZS1hZnRlci1mcmVl
IFJlYWQgaW4KPiBoZmEzODR4X3VzYmluX2NhbGxiYWNrCj4gCj4gUWl1anVuIEh1YW5nIDxocWph
Z2FpbkBnbWFpbC5jb20+Cj4gICAgIHN0YWdpbmc6IHdsYW4tbmc6IGZpeCBPREVCVUcgYnVnIGlu
IHByaXNtMnN0YV9kaXNjb25uZWN0X3VzYgo+IAo+IExhcnJ5IEZpbmdlciA8TGFycnkuRmluZ2Vy
QGx3ZmluZ2VyLm5ldD4KPiAgICAgc3RhZ2luZzogcnRsODE4OGV1OiBBZGQgQVNVUyBVU0ItTjEw
IE5hbm8gQjEgdG8gZGV2aWNlIHRhYmxlCj4gCj4gRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRl
ckBvcmFjbGUuY29tPgo+ICAgICBzdGFnaW5nOiBrcGMyMDAwOiBwcmV2ZW50IHVuZGVyZmxvdyBp
biBjcGxkX3JlY29uZmlndXJlKCkKPiAKPiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5vcmc+
Cj4gICAgIG1lZGlhOiB1c2J0djogZml4IGNvbnRyb2wtbWVzc2FnZSB0aW1lb3V0cwo+IAo+IEpv
aGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KPiAgICAgbWVkaWE6IGZsZXhjb3AtdXNiOiBm
aXggZW5kcG9pbnQgc2FuaXR5IGNoZWNrCj4gCj4gTWFucyBSdWxsZ2FyZCA8bWFuc0BtYW5zci5j
b20+Cj4gICAgIHVzYjogbXVzYjogZml4IGNyYXNoIHdpdGggaGlnaG1lbiBQSU8gYW5kIHVzYm1v
bgo+IAo+IFFpdWp1biBIdWFuZyA8aHFqYWdhaW5AZ21haWwuY29tPgo+ICAgICBVU0I6IHNlcmlh
bDogaW9fZWRnZXBvcnQ6IGZpeCBzbGFiLW91dC1vZi1ib3VuZHMgcmVhZCBpbgo+IGVkZ2VfaW50
ZXJydXB0X2NhbGxiYWNrCj4gCj4gTWF0dGhpYXMgUmVpY2hsIDxoaWFzQGhvcnVzLmNvbT4KPiAg
ICAgVVNCOiBjZGMtYWNtOiByZXN0b3JlIGNhcGFiaWxpdHkgY2hlY2sgb3JkZXIKPiAKPiBQYXdl
bCBEZW1iaWNraSA8cGF3ZWxkZW1iaWNraUBnbWFpbC5jb20+Cj4gICAgIFVTQjogc2VyaWFsOiBv
cHRpb246IGFkZCBXaXN0cm9uIE5ld2ViIEQxOVExCj4gCj4gUGF3ZWwgRGVtYmlja2kgPHBhd2Vs
ZGVtYmlja2lAZ21haWwuY29tPgo+ICAgICBVU0I6IHNlcmlhbDogb3B0aW9uOiBhZGQgQnJvYWRN
b2JpIEJNODA2VQo+IAo+IFBhd2VsIERlbWJpY2tpIDxwYXdlbGRlbWJpY2tpQGdtYWlsLmNvbT4K
PiAgICAgVVNCOiBzZXJpYWw6IG9wdGlvbjogYWRkIHN1cHBvcnQgZm9yIEFTS0VZIFdXSEMwNTAK
PiAKPiBEYW5pZWwgQm9ya21hbm4gPGRhbmllbEBpb2dlYXJib3gubmV0Pgo+ICAgICBicGY6IFVu
ZG8gaW5jb3JyZWN0IF9fcmVnX2JvdW5kX29mZnNldDMyIGhhbmRsaW5nCj4gCj4gCj4gLS0tLS0t
LS0tLS0tLQo+IAo+IERpZmZzdGF0Ogo+IAo+ICBNYWtlZmlsZSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLQo+ICBkcml2ZXJzL2F0YS9haGNpLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgZHJpdmVycy9tZWRpYS91c2Iv
YjJjMi9mbGV4Y29wLXVzYi5jICAgICAgICAgICAgICAgfCAgNiArKy0tCj4gIGRyaXZlcnMvbWVk
aWEvdXNiL2R2Yi11c2IvZGliMDcwMF9jb3JlLmMgICAgICAgICAgIHwgIDQgKy0tCj4gIGRyaXZl
cnMvbWVkaWEvdXNiL2dzcGNhL292NTE5LmMgICAgICAgICAgICAgICAgICAgIHwgMTAgKysrKysr
Cj4gIGRyaXZlcnMvbWVkaWEvdXNiL2dzcGNhL3N0djA2eHgvc3R2MDZ4eC5jICAgICAgICAgIHwg
MTkgKysrKysrKysrLQo+ICBkcml2ZXJzL21lZGlhL3VzYi9nc3BjYS9zdHYwNnh4L3N0djA2eHhf
cGIwMTAwLmMgICB8ICA0ICsrKwo+ICBkcml2ZXJzL21lZGlhL3VzYi9nc3BjYS94aXJsaW5rX2Np
dC5jICAgICAgICAgICAgICB8IDE4ICsrKysrKysrKy0KPiAgZHJpdmVycy9tZWRpYS91c2IvdXNi
dHYvdXNidHYtY29yZS5jICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL21lZGlhL3Vz
Yi91c2J0di91c2J0di12aWRlby5jICAgICAgICAgICAgICB8ICA1ICstLQo+ICBkcml2ZXJzL21l
ZGlhL3Y0bDItY29yZS92NGwyLWRldmljZS5jICAgICAgICAgICAgICB8ICAxICsKPiAgZHJpdmVy
cy9zdGFnaW5nL2twYzIwMDAva3BjMjAwMC9jb3JlLmMgICAgICAgICAgICAgfCAgNCArLS0KPiAg
ZHJpdmVycy9zdGFnaW5nL3J0bDgxODhldS9vc19kZXAvdXNiX2ludGYuYyAgICAgICAgfCAgMSAr
Cj4gIC4uLi9iaW5kaW5ncy9uZXQvd2lyZWxlc3Mvc2lsaWFicyx3ZngudHh0ICAgICAgICAgIHwg
IDcgKystLQo+ICBkcml2ZXJzL3N0YWdpbmcvd2Z4L2J1c19zZGlvLmMgICAgICAgICAgICAgICAg
ICAgICB8IDE1ICsrKystLS0tCj4gIGRyaXZlcnMvc3RhZ2luZy93ZngvYnVzX3NwaS5jICAgICAg
ICAgICAgICAgICAgICAgIHwgNDEKPiArKysrKysrKysrKysrLS0tLS0tLS0tCj4gIGRyaXZlcnMv
c3RhZ2luZy93ZngvbWFpbi5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjEgKysrKysrLS0t
LS0KPiAgZHJpdmVycy9zdGFnaW5nL3dmeC9tYWluLmggICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMSAtCj4gIGRyaXZlcnMvc3RhZ2luZy93ZngvcXVldWUuYyAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMTYgKysrKy0tLS0tCj4gIGRyaXZlcnMvc3RhZ2luZy93bGFuLW5nL2hmYTM4NHhfdXNi
LmMgICAgICAgICAgICAgIHwgIDIgKysKPiAgZHJpdmVycy9zdGFnaW5nL3dsYW4tbmcvcHJpc20y
dXNiLmMgICAgICAgICAgICAgICAgfCAgMSArCj4gIGRyaXZlcnMvdXNiL2NsYXNzL2NkYy1hY20u
YyAgICAgICAgICAgICAgICAgICAgICAgIHwgMTggKysrKystLS0tLQo+ICBkcml2ZXJzL3VzYi9t
dXNiL211c2JfaG9zdC5jICAgICAgICAgICAgICAgICAgICAgICB8IDE3ICsrKy0tLS0tLQo+ICBk
cml2ZXJzL3VzYi9zZXJpYWwvaW9fZWRnZXBvcnQuYyAgICAgICAgICAgICAgICAgICB8ICAyICst
Cj4gIGRyaXZlcnMvdXNiL3NlcmlhbC9vcHRpb24uYyAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDYgKysrKwo+ICBmcy9saWJmcy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICA4ICsrKy0tCj4gIGtlcm5lbC9icGYvdmVyaWZpZXIuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMTkgLS0tLS0tLS0tLQo+ICAyNyBmaWxlcyBjaGFuZ2VkLCAxNDkgaW5z
ZXJ0aW9ucygrKSwgMTA0IGRlbGV0aW9ucygtKQo+IAo+IAoKQ29tcGlsZWQsIGJvb3RlZCwgYW5k
IG5vIHJlZ3Jlc3Npb25zIG9uIG15IG1hY2hpbmUuCgpCUiwKVml0b3IKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1h
aWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWtlcm5lbC1tZW50ZWVzCg==
