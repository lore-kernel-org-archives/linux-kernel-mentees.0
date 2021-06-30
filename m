Return-Path: <SRS0=IXLA=LY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9BA4C11F6A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Jun 2021 06:37:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B6B361D18
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Jun 2021 06:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B6B361D18
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14418606E7;
	Wed, 30 Jun 2021 06:37:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dbDFmkA8g7hO; Wed, 30 Jun 2021 06:37:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4C1F360641;
	Wed, 30 Jun 2021 06:37:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08C6BC0010;
	Wed, 30 Jun 2021 06:37:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E713C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 06:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64DFF8269C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 06:37:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NJix027vZWrx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 06:37:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8CE5823AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 06:37:29 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id a2so1258952pgi.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 23:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QIvNKpu6whR4KbUvMINCyHMH+hf3gIcrSC/Vwhdr3Lw=;
 b=YNGt9ANUzqBZpiARnaJOzXbbBqylmMuYP/nI/dR8iVc9BR8fyloomrSEDAc7BHhB1t
 3TGc7sm8bxGH/Kh9sl8FHkfQJSb9d3wZc8s8UirITisqGy/BMijpPFumavBt9BKtTU5t
 KzteOijczl9A4g7/s10zsj2dYedhe1Fapf+4S2kq7X8GW4dWZ0TB6l4xKWnCaHJBb3yv
 aCAHePk8renhA6LzrrWsTBRGjtv5j4O5a8Au8q3RkfIywGYHTOT0+daMkNfKzK0g8ow7
 H32WH1O2xZUCj3wKo23i3lBi3mlxMgE9oEMsxMx30Gk6CRC9uoOiSUHvfb+/212Ng/q9
 bXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QIvNKpu6whR4KbUvMINCyHMH+hf3gIcrSC/Vwhdr3Lw=;
 b=Vc/9nKSM4vWLN9vbtZyKeaeGdgPHh3AXW41F8J66GMKij+JzY9NmmRvErgNf9g1R1u
 CPtCYJ477QXdJ9HaiWYgAnl1gNFhGqlao6XNUmyV3nqWW+jNuTx/O+94pSLhUECNvc6i
 0lDOpT/K46Y+MTG/T/YgWXTfBBZvCy16wp3OfzHK3QPWUmrL+LKxGcyFhOYWTANG3n4C
 WzjbPKKfJdqhVGsAU7eVTW8HVGPmliOol0KzoHUC5g076SW5YlnWACauawJfxC6CDaft
 eEFu1ClgziC2NCNImHAg3hsVDJAc25ehZFs8C11F0hIpelW7OK/upR6q3vVxSPhcpwKO
 zZVQ==
X-Gm-Message-State: AOAM532CJJtp+ACbRMHNRoZYP+sq0yCVWwfGuLWxIfte0KvH7rilyAx4
 JBY/0EXSYXO03ZWdudJoU+4=
X-Google-Smtp-Source: ABdhPJxv35ffdyTf2HuDhIhk6MMvfhVyiCMQtPK0P585CwMD0Mvofwueer0wUTiw7OflmgcVoXCMCQ==
X-Received: by 2002:a63:2f05:: with SMTP id v5mr32113452pgv.449.1625035049301; 
 Tue, 29 Jun 2021 23:37:29 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id h24sm20304574pjv.27.2021.06.29.23.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 23:37:28 -0700 (PDT)
Subject: Re: [PATCH v5 3/3] drm: protect drm_master pointers in drm_lease.c
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20210629033706.20537-1-desmondcheongzx@gmail.com>
 <20210629033706.20537-4-desmondcheongzx@gmail.com>
 <CACvgo514T=PZCWwhNsYqCC504SJ+2WivcRtmHhDoKsWMSLFU4A@mail.gmail.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <e2ca777f-f185-688a-5813-0ff2e5025f77@gmail.com>
Date: Wed, 30 Jun 2021 14:37:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACvgo514T=PZCWwhNsYqCC504SJ+2WivcRtmHhDoKsWMSLFU4A@mail.gmail.com>
Content-Language: en-US
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
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

On 30/6/21 8:16 am, Emil Velikov wrote:
> Hi Desmond,
> 
> Couple of small suggestions, with those the series is:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> 
> On Tue, 29 Jun 2021 at 04:38, Desmond Cheong Zhi Xi
> <desmondcheongzx@gmail.com> wrote:
> 
>> @@ -128,13 +137,20 @@ bool drm_lease_held(struct drm_file *file_priv, int id)
>>          struct drm_master *master;
>>          bool ret;
>>
>> -       if (!file_priv || !file_priv->master || !file_priv->master->lessor)
>> +       if (!file_priv)
>>                  return true;
>>
>> -       master = file_priv->master;
>> +       master = drm_file_get_master(file_priv);
>> +       if (master == NULL)
>> +               return true;
>> +       if (!master->lessor) {
>> +               drm_master_put(&master);
>> +               return true;
> 
> Let's add a "ret = true; goto unlock;" here, so we can have a single
> drm_master_put() in the function.
> Nearly all code paths touched by this patch already follow this approach.
> 
>> @@ -154,10 +170,16 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
>>          int count_in, count_out;
>>          uint32_t crtcs_out = 0;
>>
>> -       if (!file_priv || !file_priv->master || !file_priv->master->lessor)
>> +       if (!file_priv)
>>                  return crtcs_in;
>>
>> -       master = file_priv->master;
>> +       master = drm_file_get_master(file_priv);
>> +       if (master == NULL)
>> +               return crtcs_in;
>> +       if (!master->lessor) {
>> +               drm_master_put(&master);
>> +               return crtcs_in;
> 
> Ditto
> 
> Thanks
> Emil
> 

Sounds good to me, I'll revise these functions. Thanks for the review 
and suggestions, Emil.

Best wishes,
Desmond
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
