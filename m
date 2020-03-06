Return-Path: <SRS0=axgb=4X=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D030C10F00
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Mar 2020 14:00:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9E9220866
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Mar 2020 14:00:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZhFOhSck"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9E9220866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BACB4882F8;
	Fri,  6 Mar 2020 14:00:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F7C0TG+6q6SS; Fri,  6 Mar 2020 14:00:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 48C1B8818D;
	Fri,  6 Mar 2020 14:00:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33A27C18D3;
	Fri,  6 Mar 2020 14:00:36 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0A8AC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 14:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CA86981EAA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 14:00:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f+oKKq6sKPzu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 14:00:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9BB9A81C8D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 14:00:33 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id cx7so1102425pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Mar 2020 06:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=efYr67/bTkt21SGtVdNVaerWisMPAYyt0fWiDVwgGjk=;
 b=ZhFOhSckcSX8pV1bWCS4o4akz+nRynoamY/zQbaiHWh4a4IFicLY2Jk2OA1ffM/i96
 eKSC7h1EHCAaBCWypKBn5baMCTGxLnvA0ZoRF5qH3MVCUygz0pvYc4ujRChBBC2winPL
 saqJr4tzjm/7nPA7h/3U6NFw+J6EpK7EEKiQqDwhlRq68FbeHpxlOvw/xT1YlLaN4TPv
 P4F4KzqovD9pMu1zybSbESrlfUsJ7i1jt2NP7+iRv8sLn0VesWDFwofj1m1tPw2Us7SQ
 NVJE1uLk/ZZM8/7mH2Gdz/DybhRTFl0UmO/yWNOtoz0NGRC0QMsV0di74laEg8OwmWBw
 2/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=efYr67/bTkt21SGtVdNVaerWisMPAYyt0fWiDVwgGjk=;
 b=lkLL9xTHhxJVsm9YZkV00SdafFhzz8yzmTKokyhQgTv4lhaF5WM0jTROUJtFYFtBG6
 HyaefiAo9DsHPnxXAVw+0SVQVN3c4P9t0WE317BPvfnb8MnPRWybif7KLGrQhuElyQg4
 Ghu4kLa+NmSAxgDjPg2H+aofumqi7gELs46iylF3aFO3vRmVuNBcPCNAOPpneaEuT/mD
 mEyqi3//wSbVeYqUoW9Jv974/Zj3Z0lGKBQV9rEfnlyMJvIHHrXRC3oNsmw5t8XsSDpN
 nQTX5RdNNY+wQOIU3j/avsZq7HieuS46sLeyeUdItbA1yhcilDACnUhhOwDoBsiPSUYT
 LmZg==
X-Gm-Message-State: ANhLgQ3XLpXlmJv47JwKviNANxMU4qWwNidtjg/e6THlAmQl5I6ej2/F
 JGhUgmJf+VsNu7gkgQfDxg==
X-Google-Smtp-Source: ADFU+vtNUgRRJn2bRpQQmczbG/BE5no1t/hK7c/TWORsRGmvhtlbbtZao22ZUYqyVEVeSlNkEM5WOw==
X-Received: by 2002:a17:90a:3701:: with SMTP id
 u1mr3681744pjb.25.1583503233154; 
 Fri, 06 Mar 2020 06:00:33 -0800 (PST)
Received: from madhuparna-HP-Notebook ([218.248.46.83])
 by smtp.gmail.com with ESMTPSA id g11sm7631037pfo.184.2020.03.06.06.00.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 06 Mar 2020 06:00:31 -0800 (PST)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Fri, 6 Mar 2020 19:30:24 +0530
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Message-ID: <20200306140023.GA14186@madhuparna-HP-Notebook>
References: <20200306065243.11699-1-madhuparnabhowmik10@gmail.com>
 <dfd2c14c-acda-3862-9f48-a512e16a895c@gmx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dfd2c14c-acda-3862-9f48-a512e16a895c@gmx.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: paulmck@kernel.org, clm@fb.com, linux-kernel@vger.kernel.org,
 joel@joelfernandes.org, josef@toxicpanda.com, madhuparnabhowmik10@gmail.com,
 linux@roeck-us.net, dsterba@suse.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-btrfs@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] fs: btrfs: block-group.c: Fix
 suspicious RCU usage warning
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

T24gRnJpLCBNYXIgMDYsIDIwMjAgYXQgMDM6MTY6NTNQTSArMDgwMCwgUXUgV2VucnVvIHdyb3Rl
Ogo+IAo+IAo+IE9uIDIwMjAvMy82IOS4i+WNiDI6NTIsIG1hZGh1cGFybmFiaG93bWlrMTBAZ21h
aWwuY29tIHdyb3RlOgo+ID4gRnJvbTogTWFkaHVwYXJuYSBCaG93bWlrIDxtYWRodXBhcm5hYmhv
d21pazEwQGdtYWlsLmNvbT4KPiA+IAo+ID4gVGhlIHNwYWNlX2luZm8gbGlzdCBpcyByY3UgcHJv
dGVjdGVkLgo+ID4gSGVuY2UsIGl0IHNob3VsZCBiZSB0cmF2ZXJzZWQgd2l0aCByY3VfcmVhZF9s
b2NrIGhlbGQuCj4gPiAKPiA+IFdhcm5pbmc6Cj4gPiBbICAgMjkuMTA0NTkxXSA9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQo+ID4gWyAgIDI5LjEwNDc1Nl0gV0FSTklORzogc3VzcGljaW91
cyBSQ1UgdXNhZ2UKPiA+IFsgICAyOS4xMDUwNDZdIDUuNi4wLXJjNC1uZXh0LTIwMjAwMzA1ICMx
IE5vdCB0YWludGVkCj4gPiBbICAgMjkuMTA1MjMxXSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ID4gWyAgIDI5LjEwNTQwMV0gZnMvYnRyZnMvYmxvY2stZ3JvdXAuYzoyMDExIFJDVS1s
aXN0IHRyYXZlcnNlZCBpbiBub24tcmVhZGVyIHNlY3Rpb24hIQo+ID4gCj4gPiBSZXBvcnRlZC1i
eTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+ID4gU2lnbmVkLW9mZi1ieTog
TWFkaHVwYXJuYSBCaG93bWlrIDxtYWRodXBhcm5hYmhvd21pazEwQGdtYWlsLmNvbT4KPiA+IC0t
LQo+ID4gIGZzL2J0cmZzL2Jsb2NrLWdyb3VwLmMgfCA0ICsrKy0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9m
cy9idHJmcy9ibG9jay1ncm91cC5jIGIvZnMvYnRyZnMvYmxvY2stZ3JvdXAuYwo+ID4gaW5kZXgg
NDA0ZTA1MGNlOGVlLi45Y2FiZWVmNjZmNWIgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9idHJmcy9ibG9j
ay1ncm91cC5jCj4gPiArKysgYi9mcy9idHJmcy9ibG9jay1ncm91cC5jCj4gPiBAQCAtMTk4Nyw2
ICsxOTg3LDcgQEAgaW50IGJ0cmZzX3JlYWRfYmxvY2tfZ3JvdXBzKHN0cnVjdCBidHJmc19mc19p
bmZvICppbmZvKQo+IAo+IFRoaXMgZnVuY3Rpb24gaXMgb25seSB0cmlnZ2VyZWQgYXQgbW91bnQg
dGltZSwgd2hlcmUgbm8gb3RoZXIgcmN1Cj4gb3BlcmF0aW9uIGNhbiBoYXBwZW4uCj4KVGhhbmtz
IFF1LgoKSm9lbCBhbmQgUGF1bCwgd2hhdCBzaG91bGQgd2UgZG8gaW4gdGhpcyBjYXNlPwpTaG91
bGQgd2UganVzdCBwYXNzIGNvbmQgPSB0cnVlIG9yIHVzZSBsaXN0X2Zvcl9lYWNoX2VudHJ5IGlu
c3RlYWQ/CgpUaGFuayB5b3UsCk1hZGh1cGFybmEKCj4gVGhhbmtzLAo+IFF1Cj4gPiAgCQlidHJm
c19yZWxlYXNlX3BhdGgocGF0aCk7Cj4gPiAgCX0KPiA+ICAKPiA+ICsJcmN1X3JlYWRfbG9jaygp
Owo+ID4gIAlsaXN0X2Zvcl9lYWNoX2VudHJ5X3JjdShzcGFjZV9pbmZvLCAmaW5mby0+c3BhY2Vf
aW5mbywgbGlzdCkgewo+ID4gIAkJaWYgKCEoYnRyZnNfZ2V0X2FsbG9jX3Byb2ZpbGUoaW5mbywg
c3BhY2VfaW5mby0+ZmxhZ3MpICYKPiA+ICAJCSAgICAgIChCVFJGU19CTE9DS19HUk9VUF9SQUlE
MTAgfAo+ID4gQEAgLTIwMDcsNyArMjAwOCw4IEBAIGludCBidHJmc19yZWFkX2Jsb2NrX2dyb3Vw
cyhzdHJ1Y3QgYnRyZnNfZnNfaW5mbyAqaW5mbykKPiA+ICAJCQkJbGlzdCkKPiA+ICAJCQlpbmNf
YmxvY2tfZ3JvdXBfcm8oY2FjaGUsIDEpOwo+ID4gIAl9Cj4gPiAtCj4gPiArCXJjdV9yZWFkX3Vu
bG9jaygpOwo+ID4gKwkJCj4gPiAgCWJ0cmZzX2luaXRfZ2xvYmFsX2Jsb2NrX3JzdihpbmZvKTsK
PiA+ICAJcmV0ID0gY2hlY2tfY2h1bmtfYmxvY2tfZ3JvdXBfbWFwcGluZ3MoaW5mbyk7Cj4gPiAg
ZXJyb3I6Cj4gPiAKPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1t
ZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
