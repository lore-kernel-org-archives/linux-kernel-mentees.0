Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3468CC25B6B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Oct 2023 12:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E16CB428D2;
	Thu, 26 Oct 2023 12:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E16CB428D2
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lw5VX9q6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vwV_gs7zIFmt; Thu, 26 Oct 2023 12:18:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C56D9428D7;
	Thu, 26 Oct 2023 12:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C56D9428D7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ACCAAC0039;
	Thu, 26 Oct 2023 12:18:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D03BC0039
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 12:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A0CE418AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 12:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A0CE418AE
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Lw5VX9q6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dUZC6lcfURnY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 12:18:39 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4816D4185E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 12:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4816D4185E
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1ca79b731f1so1774475ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 05:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698322717; x=1698927517;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nn8IJ+A31H/W9cHH67lHCBS/HFYbioViyKmugnuvJtM=;
 b=Lw5VX9q6V5t02BXprZB3QPzDq+guRPm5ov5PbiPAvYrwzv3R4Vhi9BV/N/zEX4bfkz
 XW5aLjYIzayAJNwFQHAD7b/Ij52qFkTSdSsFJxbuFjj+bb7NYgbSN0DUJTECwgw0e7Sg
 72H6pNDVBDZ6B1g23S279hq2kfYhhcBTtOv/6JsQT1qq63+CKGtj4EjZBTVcY+6gHQjH
 sQi4Zy5Zp8iisB58C2lKUjsGLWhtREZef396mJh3/cyMMA2wizVKGbN5BYfyKfDb5x2U
 KhyldtwdjT4boE9ftcomdEWHc4M0+7wEjV6lSRkPjlAUrNanuHAZMCFNrKgniLLZmZHm
 Ja8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698322717; x=1698927517;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Nn8IJ+A31H/W9cHH67lHCBS/HFYbioViyKmugnuvJtM=;
 b=QqSIUGHt0JPTKWouXLNo5b33zuSPiNZ4yAUll2gv2qlNcR+LmxZ2rPoI5kXUeVBYEx
 nVEcv3nNLncypBIeDGRm4ktt9+2D08d1LXmfdk5ptePOH+AyMgjUSDghLQBzi0se4VFJ
 5OZnfV/vMxqlwg1uU3M278eW3q84Cb4/mLAVq2AoE1UgKE4KkcmmgC82joScp+aS3UR7
 h0+8xngu2oOzBBMBWK8yoLM7OcL2t7idgtoJP6qOKzGz3wRFg3bGbYeqL/vLtBvlV3oE
 s7cl4EeY9/TAzpJNMHPR+kT7dOYr20Pz30Eq0XDufevJiV8GAFlPnUOm4Pp9S2gFBcQD
 c3PA==
X-Gm-Message-State: AOJu0Yza+GCGuoWkqS8Iz0gdZ+jOpxzq0XGC64c4A4YsSOOYCMAkFFph
 7HgQVTBGjVFgz/pH0l2EO5I=
X-Google-Smtp-Source: AGHT+IGBR3Mbqrv8AlAiltkY3TRkGtkq1GgXPzRgWmBDqhMS9bSaQCMGDwS46PCMtX6VRZMgGYLlGQ==
X-Received: by 2002:a17:902:e291:b0:1ca:273d:232 with SMTP id
 o17-20020a170902e29100b001ca273d0232mr17069881plc.0.1698322717362; 
 Thu, 26 Oct 2023 05:18:37 -0700 (PDT)
Received: from [192.168.0.152] ([103.75.161.208])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a170903019000b001c60635c13esm10791976plg.115.2023.10.26.05.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 05:18:36 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------teGJ8Wzf9yOlAohCF2VAu6sM"
Message-ID: <4c171399-87ac-4273-8b73-5d9b440656d2@gmail.com>
Date: Thu, 26 Oct 2023 17:48:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fixing warning of directly dereferencing __rcu tagged
To: Andrew Morton <akpm@linux-foundation.org>
References: <20231025222811.855336-1-singhabhinav9051571833@gmail.com>
 <20231025153807.8db950f1db82b2c9ecd03758@linux-foundation.org>
 <c4688c53-4206-4d54-aed9-f877697e8073@gmail.com>
 <20231025165002.64ab92e6d55d204b66e055f4@linux-foundation.org>
Content-Language: en-US
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <20231025165002.64ab92e6d55d204b66e055f4@linux-foundation.org>
Cc: brauner@kernel.org, mjguzik@gmail.com, mst@redhat.com, peterz@infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, mathieu.desnoyers@efficios.com, shakeelb@google.com,
 surenb@google.com, michael.christie@oracle.com
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This is a multi-part message in MIME format.
--------------teGJ8Wzf9yOlAohCF2VAu6sM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/23 05:20, Andrew Morton wrote:
> On Thu, 26 Oct 2023 04:57:42 +0530 Abhinav Singh <singhabhinav9051571833@gmail.com> wrote:
> 
>> On 10/26/23 04:08, Andrew Morton wrote:
>>>> +++ b/kernel/fork.c
>>>> @@ -2369,7 +2369,9 @@ __latent_entropy struct task_struct *copy_process(
>>>>    
>>>>    	retval = -EAGAIN;
>>>>    	if (is_rlimit_overlimit(task_ucounts(p), UCOUNT_RLIMIT_NPROC, rlimit(RLIMIT_NPROC))) {
>>>> -		if (p->real_cred->user != INIT_USER &&
>>>> +		const struct cred *real_cred = rcu_dereference(p->real_cred);
>>>> +
>>>> +		if (real_cred && real_cred->user != INIT_USER &&
>>>>    		    !capable(CAP_SYS_RESOURCE) && !capable(CAP_SYS_ADMIN))
>>>>    			goto bad_fork_cleanup_count;
>>>
>>> The old code assumes that p->read_cred cannot be NULL and the new code
>>> does nothing to make it possible that `real_cred' can be NULL?
>>>
>>> In other words, I see no reason to add this new check for NULL?
>>
>> Thank you for the response!
>>
>> I thought it will be better to have check before accessing it, just so
>> we dont have any segmentation fault in future.
> 
> That would be adding code which has no effect?
> 
>> Also I just noticed there are two more places where direct dereferencing
>> of __rcu pointer is done in this same file. Should I do those changes in
>> this patch ?
> 
> I don't see why.  rcu_dereference(p) cannot return NULL if `p' is non-NULL?


--------------teGJ8Wzf9yOlAohCF2VAu6sM
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-Fixing-sparse-warning-cast-removes-address-space-__i.patch"
Content-Disposition: attachment;
 filename*0="0001-Fixing-sparse-warning-cast-removes-address-space-__i.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA1OThiZjgyYjYxMWE5YWY5NmM1ZDQxMjg1NTk1N2UzNzg1MjNmNTI5IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBYmhpbmF2IFNpbmdoIDxzaW5naGFiaGluYXY5MDUx
NTcxODMzQGdtYWlsLmNvbT4KRGF0ZTogVHVlLCAyNCBPY3QgMjAyMyAxNToyNDo1MiArMDUz
MApTdWJqZWN0OiBbUEFUQ0hdIEZpeGluZyB3YXJuaW5nIGNhc3QgcmVtb3ZlcyBhZGRyZXNz
IHNwYWNlICdfX2lvbWVtJyBvZgogZXhwcmVzc2lvbgoKVGhpcyBwYXRjaCBmaXhlcyBzcGFy
c2UgY29tcGxhaW5pbmcgYWJvdXQgdGhlIHJlbW92YWwgb2YgX19pb21lbSBhZGRyZXNzCnNw
YWNlIHdoZW4gY2FzdGluZyB0aGUgcmV0dXJuIHZhbHVlIG9mIHRoaXMgZnVuY3Rpb24gaW9y
ZW1hcF9jYWNoZSguLi4pCmZyb20gYHZvaWQgX19pb3JlbWFwKmAgdG8gYHZvaWQqYC4KCkkg
dGhpbmsgdGhlcmUgYXJlIHR3byB3YXkgb2YgZml4aW5nIGl0LCBmaXJzdCBvbmUgaXMgY2hh
bmdpbmcgdGhlCmRhdGF0eXBlIG9mIHZhcmlhYmxlIGBnaGNiX3ZhYCBmcm9tIGB2b2lkKmAg
dG8gYHZvaWQgX19pb21lbSpgIC4gClNlY29uZCB3YXkgb2YgZml4aW5nIGl0IGlzIHVzaW5n
IHRoZSBtZW1yZW1hcCguLi4pIHdoaWNoIGlzIApkb25lIGluIHRoaXMgcGF0Y2guCgpTaWdu
ZWQtb2ZmLWJ5OiBBYmhpbmF2IFNpbmdoIDxzaW5naGFiaGluYXY5MDUxNTcxODMzQGdtYWls
LmNvbT4KLS0tCiBhcmNoL3g4Ni9oeXBlcnYvaHZfaW5pdC5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYvaHlwZXJ2L2h2X2luaXQuYyBiL2FyY2gveDg2L2h5cGVydi9odl9pbml0LmMKaW5k
ZXggMjE1NTZhZDg3ZjRiLi5jMTQxNjFhZGQyNzQgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2h5
cGVydi9odl9pbml0LmMKKysrIGIvYXJjaC94ODYvaHlwZXJ2L2h2X2luaXQuYwpAQCAtNzAs
NyArNzAsNyBAQCBzdGF0aWMgaW50IGh5cGVydl9pbml0X2doY2Iodm9pZCkKIAogCS8qIE1h
c2sgb3V0IHZUT00gYml0LiBpb3JlbWFwX2NhY2hlKCkgbWFwcyBkZWNyeXB0ZWQgKi8KIAln
aGNiX2dwYSAmPSB+bXNfaHlwZXJ2LnNoYXJlZF9ncGFfYm91bmRhcnk7Ci0JZ2hjYl92YSA9
ICh2b2lkICopaW9yZW1hcF9jYWNoZShnaGNiX2dwYSwgSFZfSFlQX1BBR0VfU0laRSk7CisJ
Z2hjYl92YSA9IG1lbXJlbWFwKGdoY2JfZ3BhLCBIVl9IWVBfUEFHRV9TSVpFLCBNRU1SRU1B
UF9XQik7CiAJaWYgKCFnaGNiX3ZhKQogCQlyZXR1cm4gLUVOT01FTTsKIAotLSAKMi4zOS4y
Cgo=

--------------teGJ8Wzf9yOlAohCF2VAu6sM
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--------------teGJ8Wzf9yOlAohCF2VAu6sM--
