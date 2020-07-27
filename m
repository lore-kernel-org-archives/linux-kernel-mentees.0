Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 463BAC433EA
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 07:20:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0552520759
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 07:20:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDK8obBO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0552520759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C32948804A;
	Mon, 27 Jul 2020 07:20:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8OcloK31JwjU; Mon, 27 Jul 2020 07:20:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A286B87D8E;
	Mon, 27 Jul 2020 07:20:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83A65C004F;
	Mon, 27 Jul 2020 07:20:37 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D9D1FC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D18F585D37
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:20:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cr_31r5538mk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:20:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3C53F85D2B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:20:35 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 74so311462pfx.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 00:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=YJXjh4GmMEW7XN5/tplqsYhfZdl3H6taMH5axLntfAw=;
 b=EDK8obBOfKHNTjFkgxYJ9+5FEXC9QIaLLHJwM0UjYRXgbOW/WYsNnkfJKS0zWMKRBl
 5G+RoaiMjvm8LFeedDpWGTIR/HiNGJAhklG0TJk6dIgJOkeY9HZqlYV4DmrwKNByys3P
 Elrq6P9TpGDjVCIsjqjmlSQSNhqePcgaXZ2gp2jdGvOjgzFlD1EPa0Ew4mslTyOCTsbc
 RxP6CfefjoGYcqCDH7LsOEVFU1yVVSZIft1lpudYstiGuLQmnhN6Q+bMVFtx7HH+PYgn
 CJO0YLupfA5nXjCK/E5cpOjpZeLw9avWbMDPZSOU24yLLKwOvFteoZ0YEZYH5WRFPh6l
 NuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YJXjh4GmMEW7XN5/tplqsYhfZdl3H6taMH5axLntfAw=;
 b=KUGVaZq5mR3Tr9Q8ZqAmUBcW1kWIka40BK+17qU6doWaZ0PZGiKzzkF8NB4besZJC6
 6W+XqU9Qrhj9Ba7uVrhQBFjCSBDyTFujw4hokKfVwbBjQCz8pqak/Si2wGnmdVpqClM5
 e6NE5MUxGOwuneviNm1NSRln8UGZQy5ZrY2uAmlIbZzzwAmGYl/dsNpb17siWHejzFuK
 B+OX5yog0u2yicQeMN0W4swW64YNsKaCPQ9nOepM/EnddYX3JS++ZxDoFtwe3/T/n0dF
 qFYIVsP8GPK+pCCiLubjecSSA6pt3U49SLqXj6XGY93wYRGEg7CHy7epztOBV2wcdSGI
 Mm3Q==
X-Gm-Message-State: AOAM5337NT2kjGNI0AvnKsOg76vm5trFNsNzCf09XnLn8N2nSjDdJYn+
 feBw0jMvz68IQcszC4Ax8Cw=
X-Google-Smtp-Source: ABdhPJzo4zlFjXMsAfOgM4X3zAg74cxBAhosgrhd7WC+wNNgCrrv4S9sv/p1zxTGJSCjmjnxOwQ/tg==
X-Received: by 2002:aa7:8e0c:: with SMTP id c12mr18974880pfr.38.1595834434715; 
 Mon, 27 Jul 2020 00:20:34 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id lb13sm7971701pjb.9.2020.07.27.00.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 00:20:34 -0700 (PDT)
Date: Mon, 27 Jul 2020 12:49:10 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: kernel test robot <lkp@intel.com>
Message-ID: <20200727071910.GA6368@gmail.com>
References: <20200724110630.1219882-1-vaibhavgupta40@gmail.com>
 <202007250808.yhgHBmpJ%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202007250808.yhgHBmpJ%lkp@intel.com>
Cc: Jens Axboe <axboe@kernel.dk>, kbuild-all@lists.01.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 clang-built-linux@googlegroups.com, Bjorn Helgaas <helgaas@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] ata: use generic power
	management
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

T24gU2F0LCBKdWwgMjUsIDIwMjAgYXQgMDk6MDA6MTJBTSArMDgwMCwga2VybmVsIHRlc3Qgcm9i
b3Qgd3JvdGU6Cj4gSGkgVmFpYmhhdiwKPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaCEgUGVy
aGFwcyBzb21ldGhpbmcgdG8gaW1wcm92ZToKPiAKPiBbYXV0byBidWlsZCB0ZXN0IFdBUk5JTkcg
b24gYmxvY2svZm9yLW5leHRdCj4gW2Fsc28gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIHY1LjgtcmM2
IG5leHQtMjAyMDA3MjRdCj4gW0lmIHlvdXIgcGF0Y2ggaXMgYXBwbGllZCB0byB0aGUgd3Jvbmcg
Z2l0IHRyZWUsIGtpbmRseSBkcm9wIHVzIGEgbm90ZS4KPiBBbmQgd2hlbiBzdWJtaXR0aW5nIHBh
dGNoLCB3ZSBzdWdnZXN0IHRvIHVzZSAnLS1iYXNlJyBhcyBkb2N1bWVudGVkIGluCj4gaHR0cHM6
Ly9naXQtc2NtLmNvbS9kb2NzL2dpdC1mb3JtYXQtcGF0Y2hdCj4gCj4gdXJsOiAgICBodHRwczov
L2dpdGh1Yi5jb20vMGRheS1jaS9saW51eC9jb21taXRzL1ZhaWJoYXYtR3VwdGEvYXRhLXVzZS1n
ZW5lcmljLXBvd2VyLW1hbmFnZW1lbnQvMjAyMDA3MjQtMTkwOTI5Cj4gYmFzZTogICBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9heGJvZS9saW51eC1ibG9j
ay5naXQgZm9yLW5leHQKPiBjb25maWc6IHg4Nl82NC1hbGx5ZXNjb25maWcgKGF0dGFjaGVkIGFz
IC5jb25maWcpCj4gY29tcGlsZXI6IGNsYW5nIHZlcnNpb24gMTIuMC4wIChodHRwczovL2dpdGh1
Yi5jb20vbGx2bS9sbHZtLXByb2plY3QgMWQwOWVjZjM2MTc1Zjc5MTBmZmVkZDZkNDk3YzA3YjVj
NzRjMjJmYikKPiByZXByb2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVpbGQpOgo+ICAgICAgICAgd2dl
dCBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vaW50ZWwvbGtwLXRlc3RzL21hc3Rl
ci9zYmluL21ha2UuY3Jvc3MgLU8gfi9iaW4vbWFrZS5jcm9zcwo+ICAgICAgICAgY2htb2QgK3gg
fi9iaW4vbWFrZS5jcm9zcwo+ICAgICAgICAgIyBpbnN0YWxsIHg4Nl82NCBjcm9zcyBjb21waWxp
bmcgdG9vbCBmb3IgY2xhbmcgYnVpbGQKPiAgICAgICAgICMgYXB0LWdldCBpbnN0YWxsIGJpbnV0
aWxzLXg4Ni02NC1saW51eC1nbnUKPiAgICAgICAgICMgc2F2ZSB0aGUgYXR0YWNoZWQgLmNvbmZp
ZyB0byBsaW51eCBidWlsZCB0cmVlCj4gICAgICAgICBDT01QSUxFUl9JTlNUQUxMX1BBVEg9JEhP
TUUvMGRheSBDT01QSUxFUj1jbGFuZyBtYWtlLmNyb3NzIEFSQ0g9eDg2XzY0IAo+IAo+IElmIHlv
dSBmaXggdGhlIGlzc3VlLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWcgYXMgYXBwcm9wcmlhdGUK
PiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gCj4gQWxs
IHdhcm5pbmdzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6Cj4gCj4gPj4gZHJpdmVycy9hdGEv
cGF0YV90cmlmbGV4LmM6MTg2OjM2OiB3YXJuaW5nOiBJU08gQzkwIGZvcmJpZHMgbWl4aW5nIGRl
Y2xhcmF0aW9ucyBhbmQgY29kZSBbLVdkZWNsYXJhdGlvbi1hZnRlci1zdGF0ZW1lbnRdCj4gICAg
ICAgICAgICBzdGF0aWMgY29uc3Qgc3RydWN0IGF0YV9wb3J0X2luZm8gaW5mbyA9IHsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gICAgMSB3YXJuaW5n
IGdlbmVyYXRlZC4KPiAKPiB2aW0gKzE4NiBkcml2ZXJzL2F0YS9wYXRhX3RyaWZsZXguYwo+IAo+
IDY2OWE1ZGI0MTFkODVhIEplZmYgR2FyemlrICAgICAyMDA2LTA4LTI5ICAxNzYgIAo+IDY2OWE1
ZGI0MTFkODVhIEplZmYgR2FyemlrICAgICAyMDA2LTA4LTI5ICAxNzcgIHN0YXRpYyBpbnQgdHJp
ZmxleF9pbml0X29uZShzdHJ1Y3QgcGNpX2RldiAqZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2Rldmlj
ZV9pZCAqaWQpCj4gNjY5YTVkYjQxMWQ4NWEgSmVmZiBHYXJ6aWsgICAgIDIwMDYtMDgtMjkgIDE3
OCAgewo+IDVhY2Q3NGI1OTI5MzNmIFZhaWJoYXYgR3VwdGEgICAyMDIwLTA3LTI0ICAxNzkgIAkv
Kgo+IDVhY2Q3NGI1OTI5MzNmIFZhaWJoYXYgR3VwdGEgICAyMDIwLTA3LTI0ICAxODAgIAkgKiBX
ZSBtdXN0IG5vdCBkaXNhYmxlIG9yIHBvd2VyZG93biB0aGUgZGV2aWNlLgo+IDVhY2Q3NGI1OTI5
MzNmIFZhaWJoYXYgR3VwdGEgICAyMDIwLTA3LTI0ICAxODEgIAkgKiBBUE0gYmlvcyByZWZ1c2Vz
IHRvIHN1c3BlbmQgaWYgSURFIGlzIG5vdCBhY2Nlc3NpYmxlLgo+IDVhY2Q3NGI1OTI5MzNmIFZh
aWJoYXYgR3VwdGEgICAyMDIwLTA3LTI0ICAxODIgIAkgKi8KPiA1YWNkNzRiNTkyOTMzZiBWYWli
aGF2IEd1cHRhICAgMjAyMC0wNy0yNCAgMTgzICAJZGV2LT5wbV9jYXAgPSAwOwo+IDVhY2Q3NGI1
OTI5MzNmIFZhaWJoYXYgR3VwdGEgICAyMDIwLTA3LTI0ICAxODQgIAlkZXZfaW5mbygmZGV2LT5k
ZXYsICJEaXNhYmxlIHRyaWZsZXggdG8gYmUgdHVybmVkIG9mZiBieSBQQ0kgQ09SRVxuIik7Cj4g
NWFjZDc0YjU5MjkzM2YgVmFpYmhhdiBHdXB0YSAgIDIwMjAtMDctMjQgIDE4NSAgCj4gMTYyNmFl
Yjg4MTIzNmMgVGVqdW4gSGVvICAgICAgIDIwMDctMDUtMDQgQDE4NiAgCXN0YXRpYyBjb25zdCBz
dHJ1Y3QgYXRhX3BvcnRfaW5mbyBpbmZvID0gewo+IDFkMjgwOGZkM2QyZDVkIEplZmYgR2Fyemlr
ICAgICAyMDA3LTA1LTI4ICAxODcgIAkJLmZsYWdzID0gQVRBX0ZMQUdfU0xBVkVfUE9TUywKPiAx
NGJkZWY5ODJjYWVkYSBFcmlrIEluZ2UgQm9sc8O4IDIwMDktMDMtMTQgIDE4OCAgCQkucGlvX21h
c2sgPSBBVEFfUElPNCwKPiAxNGJkZWY5ODJjYWVkYSBFcmlrIEluZ2UgQm9sc8O4IDIwMDktMDMt
MTQgIDE4OSAgCQkubXdkbWFfbWFzayA9IEFUQV9NV0RNQTIsCj4gNjY5YTVkYjQxMWQ4NWEgSmVm
ZiBHYXJ6aWsgICAgIDIwMDYtMDgtMjkgIDE5MCAgCQkucG9ydF9vcHMgPSAmdHJpZmxleF9wb3J0
X29wcwo+IDY2OWE1ZGI0MTFkODVhIEplZmYgR2FyemlrICAgICAyMDA2LTA4LTI5ICAxOTEgIAl9
Owo+IDE2MjZhZWI4ODEyMzZjIFRlanVuIEhlbyAgICAgICAyMDA3LTA1LTA0ICAxOTIgIAljb25z
dCBzdHJ1Y3QgYXRhX3BvcnRfaW5mbyAqcHBpW10gPSB7ICZpbmZvLCBOVUxMIH07Cj4gNjY5YTVk
YjQxMWQ4NWEgSmVmZiBHYXJ6aWsgICAgIDIwMDYtMDgtMjkgIDE5MyAgCj4gMDYyOTZhMWU2ODRi
Y2QgSm9lIFBlcmNoZXMgICAgIDIwMTEtMDQtMTUgIDE5NCAgCWF0YV9wcmludF92ZXJzaW9uX29u
Y2UoJmRldi0+ZGV2LCBEUlZfVkVSU0lPTik7Cj4gNjY5YTVkYjQxMWQ4NWEgSmVmZiBHYXJ6aWsg
ICAgIDIwMDYtMDgtMjkgIDE5NSAgCj4gMWM1YWZkZjdhNjI5ZDIgVGVqdW4gSGVvICAgICAgIDIw
MTAtMDUtMTkgIDE5NiAgCXJldHVybiBhdGFfcGNpX2JtZG1hX2luaXRfb25lKGRldiwgcHBpLCAm
dHJpZmxleF9zaHQsIE5VTEwsIDApOwo+IDY2OWE1ZGI0MTFkODVhIEplZmYgR2FyemlrICAgICAy
MDA2LTA4LTI5ICAxOTcgIH0KPiA2NjlhNWRiNDExZDg1YSBKZWZmIEdhcnppayAgICAgMjAwNi0w
OC0yOSAgMTk4ICAKPiAKPiAtLS0KPiAwLURBWSBDSSBLZXJuZWwgVGVzdCBTZXJ2aWNlLCBJbnRl
bCBDb3Jwb3JhdGlvbgo+IGh0dHBzOi8vbGlzdHMuMDEub3JnL2h5cGVya2l0dHkvbGlzdC9rYnVp
bGQtYWxsQGxpc3RzLjAxLm9yZwoKRml4ZWQgaW4gdjIuIFdpbGwgZmxvYXQgdjIgYWZ0ZXIgZmV3
IG1vcmUgY2hlY2tzLgoKVGhhbmtzClZhaWJoYXYgR3VwdGEKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBs
aXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVs
LW1lbnRlZXMK
