Return-Path: <SRS0=/4fU=DJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A84C4741F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 10:55:35 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 268D920708
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 10:55:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="odAo3zHg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 268D920708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C80BA86357;
	Fri,  2 Oct 2020 10:55:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XfvEhP3_DO4o; Fri,  2 Oct 2020 10:55:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 145308630F;
	Fri,  2 Oct 2020 10:55:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01ED9C016F;
	Fri,  2 Oct 2020 10:55:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C7F9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 10:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0B852204FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 10:55:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qvJdKtkOHBjk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 10:55:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 1E991204CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 10:55:31 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id d13so554601pgl.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Oct 2020 03:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=I3l3pW7Q2Q9okF2imcqI+zzuik+YfrLOZr205jkuH+8=;
 b=odAo3zHgm1zZYT0pe5T8WJVP7L80LgED9ZRhTaVeHHY1rR0ItOX4c4TqvOA1VfvPwE
 yl8BaawUJvMlFjHSvve2wbNgFGiL+OkRXIUC3JPQMFxoslWxxShskfBmNhx8aItG2cqp
 KvBEJjCCw5B21ehOQ7ek0b0/y5x+zP2tuc+U/6jqsRPKbt9SP+zMAHxU0VwAVsLE6icB
 lnZnWDFPKBR737aCJ7In0ssj+qNzgmjpPtXxFJVTdx+vRQyxvmz4KbBDEU5JlbZLQ+4u
 YAVNuElr9s+tbnqdtBEf8Mp1tDai2Ss06qX6Iypcn77qvap5Pdtr+Sdivnt9ie1OxJLs
 Eq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=I3l3pW7Q2Q9okF2imcqI+zzuik+YfrLOZr205jkuH+8=;
 b=nfhUPCBedI29Xqsf65SmlvbzFM/Jsv6U63PnbUp623teHEwm1sSY4EJcGqStj7WQ0J
 MkZ01x2QI08ZhOJjQKjJOcvudGGp+3fjKUCj/cZ9lmpaCINRoH2scWptrdliBnur0zI6
 hBLulXR26lK+CHq6UHwTLzJVIT7IOFWNR9nt/COWJiq/uGpPKV483NrvY1N32TPttZrh
 oST38sI1w+PRtxZKZFAe00Z5whrp6rl7UH0ZJhxBVlh4AvEjc7sJHrGCgA3304j6Y/u0
 xP9MOX+2mMsi56oDsGdOzicprtXCKJgMBBEQenSxduCbxIi1IsKgVV5voi94CynoXRcr
 9KUA==
X-Gm-Message-State: AOAM532ViC64Ahd9JO50PvKF8Jne4pJSiq499vtVSY92ujRAxxKklhNg
 NOBTOWoElgelG81mik59tWA=
X-Google-Smtp-Source: ABdhPJwoHAzGsxNS1W+ppr9tgidop7dSUNJHWMP0mvnqAXpS9f9Mspru3pgObTSnaU5sA2OM3Ow6/w==
X-Received: by 2002:a05:6a00:2387:b029:142:2501:3970 with SMTP id
 f7-20020a056a002387b029014225013970mr1971780pfc.53.1601636130257; 
 Fri, 02 Oct 2020 03:55:30 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.217.69])
 by smtp.gmail.com with ESMTPSA id e11sm1462142pfl.58.2020.10.02.03.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 03:55:29 -0700 (PDT)
To: Hans de Goede <hdegoede@redhat.com>
References: <20201001194329.9328-1-anant.thazhemadam@gmail.com>
 <33d8c103-0c24-3ad7-2a3c-ffeb625521ee@redhat.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <52301834-83de-45e3-ff93-27fb3f865c5a@gmail.com>
Date: Fri, 2 Oct 2020 16:25:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <33d8c103-0c24-3ad7-2a3c-ffeb625521ee@redhat.com>
Content-Language: en-US
Cc: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com,
 Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] bluetooth: hci_h5: close
 serdev device and free hu in h5_close
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

T24gMDIvMTAvMjAgMzo1MiBwbSwgSGFucyBkZSBHb2VkZSB3cm90ZToKPiBIaSwKPgo+IE9uIDEw
LzEvMjAgOTo0MyBQTSwgQW5hbnQgVGhhemhlbWFkYW0gd3JvdGU6Cj4+IFdoZW4gaDVfY2xvc2Uo
KSBnZXRzIGNhbGxlZCwgdGhlIG1lbW9yeSBhbGxvY2F0ZWQgZm9yIHRoZSBodSBnZXRzCj4+IGZy
ZWVkIG9ubHkgaWYgaHUtPnNlcmRldiBkb2Vzbid0IGV4aXN0LiBUaGlzIGxlYWRzIHRvIGEgbWVt
b3J5IGxlYWsuCj4+IFNvIHdoZW4gaDVfY2xvc2UoKSBpcyByZXF1ZXN0ZWQsIGNsb3NlIHRoZSBz
ZXJkZXYgZGV2aWNlIGluc3RhbmNlIGFuZAo+PiBmcmVlIHRoZSBtZW1vcnkgYWxsb2NhdGVkIHRv
IHRoZSBodSBlbnRpcmVseSBpbnN0ZWFkLgo+Pgo+PiBGaXhlczogY2U5NDU1NTJmZGU0ICgiQmx1
ZXRvb3RoOiBoY2lfaDU6IEFkZCBzdXBwb3J0IGZvciBzZXJkZXYgZW51bWVyYXRlZCBkZXZpY2Vz
IikKPj4gUmVwb3J0ZWQtYnk6IHN5emJvdCs2Y2UxNDFjNTViMmY3YWFmZDFjNEBzeXprYWxsZXIu
YXBwc3BvdG1haWwuY29tCj4+IFRlc3RlZC1ieTogc3l6Ym90KzZjZTE0MWM1NWIyZjdhYWZkMWM0
QHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KPj4gU2lnbmVkLW9mZi1ieTogQW5hbnQgVGhhemhl
bWFkYW0gPGFuYW50LnRoYXpoZW1hZGFtQGdtYWlsLmNvbT4KPgo+IFNvIDIgY29tbWVudHMgdG8g
dGhpczoKPgo+IDEuIFlvdSBjbGFpbSB0aGlzIGNoYW5nZSBmaXhlcyBhIG1lbW9yeS1sZWFrLCBi
dXQgaW4gdGhlIHNlcmRldiBjYXNlCj4gdGhlIG1lbW9yeSBpcyBhbGxvY2F0ZWQgaW4gaDVfc2Vy
ZGV2X3Byb2JlKCkgbGlrZSB0aGlzOgo+Cj4gwqDCoMKgwqDCoMKgIGg1ID0gZGV2bV9remFsbG9j
KGRldiwgc2l6ZW9mKCpoNSksIEdGUF9LRVJORUwpOwo+Cj4gU28gaXRzIGxpZmV0aW1lIGlzIHRp
ZWQgdG8gdGhlIGxpZmV0aW1lIG9mIHRoZSBkcml2ZXIgYmVpbmcgYm91bmQKPiB0byB0aGUgc2Vy
ZGV2IGFuZCBpdCBpcyBhdXRvbWF0aWNhbGx5IGZyZWVkIHdoZW4gdGhlIGRyaXZlciBnZXRzCj4g
dW5ib3VuZC4gSWYgeW91IGhhZCBsb29rZWQgYXQgd2hlcmUgdGhlIGg1IHN0cnVjdCBnZXRzIGFs
bG9jYXRlZAo+IGluIGg1X2Nsb3NlKCktcyBjb3VudGVycGFydCwgaDVfb3BlbigpIHRoZW4geW91
IGNvdWxkIGhhdmUgc2Vlbgo+IHRoaXMgdGhlcmU6Cj4KPiDCoMKgwqDCoMKgwqDCoCBpZiAoaHUt
PnNlcmRldikgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoNSA9IHNlcmRldl9k
ZXZpY2VfZ2V0X2RydmRhdGEoaHUtPnNlcmRldik7Cj4gwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaDUgPSBremFsbG9jKHNpemVvZigqaDUp
LCBHRlBfS0VSTkVMKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFoNSkK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAt
RU5PTUVNOwo+IMKgwqDCoMKgwqDCoMKgIH0KPgo+IFNvIGl0IGlzIHZlcnkgY2xlYXIgaGVyZSwg
dGhhdCB0aGUga3phbGxvYyBvbmx5IGhhcHBlbnMgaW4gdGhlCj4gaWYgKCFodS0+c2VyZGV2KSB3
aGljaCBjbGVhcmx5IG1ha2VzIHRoZSBrZnJlZSgpIGhhdmUgdGhlIHNhbWUKPiBjb25kaXRpb24g
dGhlIHJpZ2h0IHRoaW5nIHRvZG8uIEluIHRoZSBodS0+c2VyZGV2IHRoZSBkYXRhIHdoaWNoCj4g
d2FzIGFsbG9jYXRlZCBieSBoNV9zZXJkZXZfcHJvYmUoKSBpcyB1c2VkIGluc3RlYWQgYW5kIG5v
IGFsbG9jCj4gaGFwcGVucyBpbnNpZGUgaDVfb3BlbigpCj4KPiBJbiBnZW5lcmFsIHdoZW4gbG9v
a2luZyBhdCByZXNvdXJjZSB0ZWFyZG93biB5b3Ugc2hvdWxkIGFsc28gbG9vawo+IGF0IHdoZXJl
IHRoZXkgYXJlIGFsbG9jYXRlZCBpbiB0aGUgbWlycm9yIGZ1bmN0aW9uCj4gYW5kIHRoZSB0ZWFy
ZG93biBzaG91bGQgbWlycm9yIHRoZSBhbGxvYyBjb2RlLgo+Cj4gU28gdGhlIG1haW4gY2hhbmdl
IG9mIHlvdXIgY29tbWl0IGlzIHdyb25nOgo+Cj4gTkFDSy4KPgo+Cj4gMi4gWW91IGFyZSBtYWtp
bmcgbXVsdGlwbGUgY2hhbmdlcyBpbiBhIHNpbmdsZSBjb21taXQgaGVyZSwgSSBjb3VudCBhdAo+
IGxlYXN0IDMuIFdoZW4gZXZlciB5b3UgYXJlIG1ha2luZyBtdWx0aXBsZSBjaGFuZ2VzIGxpa2Ug
dGhpcywgeW91IHNob3VsZCByZWFsbHkKPiBzcGxpdCB0aGUgY29tbWl0IHVwIGluIDEgY29tbWl0
IHBlciBjaGFuZ2UgYW5kIGV4cGxhaW4gaW4gZWFjaCBjb21taXQKPiBtZXNzYWdlIHdoeSB0aGF0
IGNoYW5nZSBpcyBiZWluZyBtYWRlICh3aHkgaXQgaXMgbmVjZXNzYXJ5KS4gV3JpdGluZwo+IGNv
bW1pdCBtZXNzYWdlcyBsaWtlIHRoaXMgYWxzbyBsZWFkcyB0byB5b3UgZG91YmxlLWNoZWNraW5n
IHlvdXIgb3duCj4gd29yayBieSBjYXJlZnVsbHkgY29uc2lkZXJpbmcgd2h5IHlvdSBhcmUgbWFr
aW5nIHRoZSBjaGFuZ2VzLgo+Cj4gU28gYWJvdXQgdGhlIDMgZGlmZmVyZW50IGNoYW5nZXM6Cj4K
PiAyYSkgTWFrZSB0aGUga2ZyZWUoaDUpIGNhbGwgdW5jb25kaXRpb25hbGx5LCB3aGljaCBhcyBt
ZW50aW9uZWQgYWJvdmUKPiBpcyB3cm9uZy4KPgpIbW0sIEkgdW5kZXJzdGFuZCwgdGhhbmsgeW91
LgoKPiAyYikgSW50cm9kdWNlIGEgY2FsbCB0byBrZnJlZV9za2IoaDUtPnJ4X3NrYik7IHdoaWNo
IGlzIG5vdCBtZW50aW9uZWQgaW4KPiB0aGUgY29tbWl0IG1lc3NhZ2UgYXQgYWxsLsKgIFRoaXMg
bG9va3MgbGlrZSBpdCB3b3VsZCBhY3R1YWxseSBiZSBhIHNlbnNpYmxlCj4gY2hhbmdlLCBhdCBs
ZWFzdCBpbiB0aGUgImlmICghaHUtPnNlcmRldikiIGNhc2UuwqAgV2hlbiB1c2luZyB0aGUgc2Vy
ZGV2Cj4gaW50ZXJmYWNlIHRoZW4ganVzdCBmcmVlaW5nIGl0IHdpbGwgbGVhdmUgYSBkYW5nbGlu
ZyBwb2ludGVyLCBzbyBpdAo+IHdvdWxkIGJlIGJldHRlciAoZm9yIGJvdGggdGhlIGh1LT5zZXJk
ZXYgYW5kIHRoZSAhaHUtPnNlcmRldiBjYXNlcykKPiB0byBjYWxsIGg1X3Jlc2V0X3J4KCkgb24g
Y2xvc2UgaW5zdGVhZCB3aGljaCBkb2VzOgo+Cj4gwqDCoMKgwqDCoMKgwqAgaWYgKGg1LT5yeF9z
a2IpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAga2ZyZWVfc2tiKGg1LT5yeF9z
a2IpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoNS0+cnhfc2tiID0gTlVMTDsK
PiDCoMKgwqDCoMKgwqDCoCB9Cj4KVGhpcyB3YXMgdGhlIGZpcnN0IHRoaW5nIEkgZGlkISAoYW5k
IEkgdGVzdGVkIGFuZCBpdCB3b3JrcyB0b28pCsKgwqDCoCDCoMKgwqAgaHR0cHM6Ly9zeXprYWxs
ZXIuYXBwc3BvdC5jb20vdGV4dD90YWc9UGF0Y2gmeD0xM2FjZjkxNzkwMDAwMAoKSG93ZXZlciwg
SSB3YXMgd29ycmllZCB0aGF0IGRvaW5nIHNvIG1pZ2h0IG1lYW4gZnJlZWluZyBhbiBza2IKdGhh
dCBtaWdodCBiZSByZXF1aXJlZCBzb21ld2hlcmUgYnkgdGhlIHNlcmRldiBjb25uZWN0aW9uICh3
aGljaCBjb3VsZApwb3NzaWJseSBsZWFkIHRvIGEgbnVsbCBwdHIgZGVyZWZlcmVuY2UpLCBzbyBJ
IHRob3VnaHQgY2xvc2luZyB0aGUgY29ubmVjdGlvbgphbHRvZ2V0aGVyIG1pZ2h0IGJlIGEgYmV0
dGVyIGFsdGVybmF0aXZlLgoKQnV0IG5vdywgc2luY2UgSSd2ZSBiZWVuIHRvbGQgYmV0dGVyLCBJ
J2xsIHN1Ym1pdCBhIHYzLCB0aGF0IG1ha2VzIHRoZSBtb3JlCnNlbnNpYmxlIGNoYW5nZSBhbmQg
ZG9lc24ndCBjbG9zZSB0aGUgc2VyZGV2X2RldmljZSwgd2l0aCBhIG11Y2ggbW9yZQppbmZvcm1h
dGl2ZSBjb21taXQgbWVzc2FnZSEKCkkgYWxzbyBmb3VuZCBhIHNpbWlsYXIgaW1wbGVtZW50YXRp
b24gaW4gbXJ2bF9jbG9zZSgpIHdoZXJlIHRoZSBzZXJkZXZfZGV2aWNlCndhcyBiZWluZyBjbG9z
ZWQgYW5kIGZlbHQgaXQgbWlnaHQgYmUgdGhlIHJpZ2h0IHdheSB0byBnby4gQnV0IEkgbm93IGtu
b3cgdGhhdApJIHNob3VsZG4ndCBoYXZlIG92ZXJsb29rZWQgdGhlIGZhY3QgdGhhdCB0aGUgb3Bl
biBmdW5jdGlvbnMgZm9yIGJvdGggZGlmZmVyLgpJJ20gc29ycnkgZm9yIHRoaXMuCgpMaWtlIHlv
dSBtZW50aW9uZWQsIEkgc2hvdWxkJ3ZlIGdpdmVuIG1vcmUgcHJpb3JpdHkgdG8gdGhlIG1pcnJv
ciBmdW5jdGlvbiwKYW5kIGxvb2tlZCB0byBzZWUgaWYgZXZlbiB0aGV5IHdlcmUgYWxvbmcgdGhl
IHNhbWUgbGluZXMsIGFuZCBJIHdpbGwgYmUgc3VyZSB0bwprZWVwIHRoYXQgaW4gbWluZC4KCj4g
MmMpIEludHJvZHVjZSBhIGNhbGwgdG8gc2VyZGV2X2RldmljZV9jbG9zZSgpLCB3aXRob3V0IHJl
YWxseSBleHBsYWluaW5nCj4gd2h5IGluIHRoZSBjb21taXQgbWVzc2FnZS4gQWdhaW4gaWYgeW91
IHdvdWxkIGhhdmUgbG9va2VkIGF0IHRoZSBtaXJyb3IKPiBoNV9jbG9zZSgpIGZ1bmN0aW9uIHRo
ZW4geW91IHNlZSBubyBzZXJkZXZfZGV2aWNlX29wZW4oKSB0aGVyZS4KPiBBY3R1YWxseSBzZXJk
ZXZfZGV2aWNlX29wZW4oKSBpcyBub3QgY2FsbGVkIGFueXdoZXJlIGluIHRoZSBoY2lfaDUuYyBj
b2RlLgo+Cj4gRGlnZ2luZyBhIGxpdHRsZSBkZWVwZXIgKHVzaW5nIGdyZXApIHNob3dzIHRoYXQg
aGNpX3VhcnRfcmVnaXN0ZXJfZGV2aWNlKCkKPiBjYWxscyBzZXJkZXZfZGV2aWNlX29wZW4oKSBh
bmQgaGNpX3VhcnRfcmVnaXN0ZXJfZGV2aWNlKCkgZ2V0cyBjYWxsZWQgZnJvbToKPiBoNV9zZXJk
ZXZfcHJvYmUoKSwgbGlrZXdpc2UgaGNpX3VhcnRfdW5yZWdpc3Rlcl9kZXZpY2UoKSBjYWxscwo+
IHNlcmRldl9kZXZpY2VfY2xvc2UoKSBmb3IgdXMgYW5kIHRoYXQgZ2V0cyBjYWxsZWQgZnJvbSBo
NV9zZXJkZXZfcmVtb3ZlKCksCj4gc28gdGhlcmUgaXMgbm8gbmVlZCB0byBjYWxsIHNlcmRldl9k
ZXZpY2VfY2xvc2UoKSBmcm9tIGg1X2Nsb3NlKCkgYW5kIGRvaW5nCj4gc28gd2lsbCBhY3R1YWxs
eSBicmVhayB0aGluZ3MsIGJlY2F1c2UgdGhlbiB0aGUgc2VyZGV2IHdpbGwgYmUgbGVmdCBjbG9z
ZWQKPiBvbiBhIHN1YnNlcXVlbnQgaDVfb3BlbigpIGNhbGwuCj4KPiBSZWdhcmRzLAo+Cj4gSGFu
cwo+ClRoYW5rIHlvdSBzbyBtdWNoIGZvciB0aGlzIHJldmlldywgYW5kIGZvciB5b3VyIHRpbWUh
IDopCgpUaGFua3MsCkFuYW50Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwt
bWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
