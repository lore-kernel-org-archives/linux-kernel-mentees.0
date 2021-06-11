Return-Path: <SRS0=OZPh=LF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6C3C48BDF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Jun 2021 03:11:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2B1A61359
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Jun 2021 03:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2B1A61359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A59EB606EE;
	Fri, 11 Jun 2021 03:11:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hoKRA9u1DsoL; Fri, 11 Jun 2021 03:11:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CAC9B606DD;
	Fri, 11 Jun 2021 03:11:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 937F6C000D;
	Fri, 11 Jun 2021 03:11:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8ACFEC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Jun 2021 03:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71B0C606EE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Jun 2021 03:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D2lmD39D7TfF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Jun 2021 03:11:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94F08606DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Jun 2021 03:11:01 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 go18-20020a17090b03d2b029016e4ae973f7so4039952pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 20:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=y4prOr8o9Yrbtks61jFL7WPXITvzhL37T1tTULKWr64=;
 b=bDIft2UOAn67MfE/MQtn5OMB6NfhrtTY4RgKtZ0gOuujkq0k8b4L2p/BkWp5hg7Yvr
 qzFeB3Vna1mNiKZ08+MeeIYirYkiaGglDnbivvgkjhh9r5dvCJ0ZlV2qC+DbC8WGmJTh
 sZPAob+YrFYiZuxrzMODEpSgdHndj3F/k8b6UwomISh2s80Won5w1jjr6wTdaoex6JJ7
 bC0TRRCeyOz5glCtNye84k1bSDFNCAPoPPys+B0DVQogDzaMoXGC4dZ9zhD9Fnn3TAEc
 dZOVUXFU7xqW3SqOLPYnMduHsmIAIeqBf9yX/rT9ahHFk6xrmbl2UUM6VQtxQdV104X3
 h0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y4prOr8o9Yrbtks61jFL7WPXITvzhL37T1tTULKWr64=;
 b=mRanJ+fxe35ssKftsFehfg1wEPZSMnYYJ+tXG1aFVHAdE42fWFb1UyaMnKTHK4Lndq
 gCAUARKgONsAp8EabMfmSrrjpHqXQCPCViUaHqxf7u8HieXjcypoykBqOS4Q6N7MQNJN
 yqLeeUzmCTCaskBdfrtXFL9WiD/r/z6b4NsmW3YPNEV5fH4Lv8QaUa0J8ZnQC9nx4/Z4
 wPQHNQVasrcBkDQGwy/FIeENBJZbBbg3mKrrYPV8HmKCJ31yrAcRY8nnJlwbVtOQyufU
 z6B2+0Q2CO6KuELx5AWwZhl5LRE5uR8RZlbDX7PqtxqdvyDaqfqAv/VvU6nQTQ/tNr5r
 r0jQ==
X-Gm-Message-State: AOAM531xE3xfYXFUqmOuxwrz+N9PKlX6WrMAQ8gUTNTIg1L7TaSlLAHa
 nwBZrYWT09blcn2HUjz+/Zo=
X-Google-Smtp-Source: ABdhPJytmw3t0plsGu1s3pJHOmMhH+nO+rWH4XVq3grkpfzTHXrf0/lejne5dFN8LlPjFKguJgkypg==
X-Received: by 2002:a17:90a:66c9:: with SMTP id
 z9mr2239212pjl.122.1623381060940; 
 Thu, 10 Jun 2021 20:11:00 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id v6sm4195582pgk.33.2021.06.10.20.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 20:11:00 -0700 (PDT)
Subject: Re: [PATCH] drm: Lock pointer access in drm_master_release()
To: Emil Velikov <emil.l.velikov@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 skhan@linuxfoundation.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20210609092119.173590-1-desmondcheongzx@gmail.com>
 <YMHlLQHRLWgWlXTs@phenom.ffwll.local>
 <CACvgo53xvUD-YgU_rhG3GDg18jygwAP78aj8OJd457SEFpAf7g@mail.gmail.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <ddc6353a-4d75-6826-dda7-be9f9dd35d1c@gmail.com>
Date: Fri, 11 Jun 2021 11:10:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CACvgo53xvUD-YgU_rhG3GDg18jygwAP78aj8OJd457SEFpAf7g@mail.gmail.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 11/6/21 1:49 am, Emil Velikov wrote:
> On Thu, 10 Jun 2021 at 11:10, Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> On Wed, Jun 09, 2021 at 05:21:19PM +0800, Desmond Cheong Zhi Xi wrote:
>>> This patch eliminates the following smatch warning:
>>> drivers/gpu/drm/drm_auth.c:320 drm_master_release() warn: unlocked access 'master' (line 318) expected lock '&dev->master_mutex'
>>>
>>> The 'file_priv->master' field should be protected by the mutex lock to
>>> '&dev->master_mutex'. This is because other processes can concurrently
>>> modify this field and free the current 'file_priv->master'
>>> pointer. This could result in a use-after-free error when 'master' is
>>> dereferenced in subsequent function calls to
>>> 'drm_legacy_lock_master_cleanup()' or to 'drm_lease_revoke()'.
>>>
>>> An example of a scenario that would produce this error can be seen
>>> from a similar bug in 'drm_getunique()' that was reported by Syzbot:
>>> https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803
>>>
>>> In the Syzbot report, another process concurrently acquired the
>>> device's master mutex in 'drm_setmaster_ioctl()', then overwrote
>>> 'fpriv->master' in 'drm_new_set_master()'. The old value of
>>> 'fpriv->master' was subsequently freed before the mutex was unlocked.
>>>
>>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>>
>> Thanks a lot. I've done an audit of this code, and I found another
>> potential problem in drm_is_current_master. The callers from drm_auth.c
>> hold the dev->master_mutex, but all the external ones dont. I think we
>> need to split this into a _locked function for use within drm_auth.c, and
>> the exported one needs to grab the dev->master_mutex while it's checking
>> master status. Ofc there will still be races, those are ok, but right now
>> we run the risk of use-after free problems in drm_lease_owner.
>>
> Note that some code does acquire the mutex via
> drm_master_internal_acquire - so we should be careful.
> As mentioned elsewhere - having a _locked version of
> drm_is_current_master sounds good.
> 
> Might as well throw a lockdep_assert_held_once in there just in case :-P
> 
> Happy to help review the follow-up patches.
> -Emil
> 

Thanks for the advice, Emil!

I did a preliminary check on the code that calls 
drm_master_internal_acquire in drm_client_modeset.c and drm_fb_helper.c, 
and it doesn't seem like they eventually call drm_is_current_master. So 
we should be good on that front.

lockdep_assert_held_once sounds good :)

Best wishes,
Desmond

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
