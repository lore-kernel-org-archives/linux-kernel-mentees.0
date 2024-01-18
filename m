Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB532E821
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 18 Jan 2024 20:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705609193; cv=none; b=D8TNYIb/2p1Fk6fLal7VxgJg+P1Qba3ooBEF1gVPHzeIYtsRSfjSg0Uy5zh0vJA8SMvTBeQhTTznwXi+DJ+AkJFzzgfVAU/9BIo4Q2skn1KU4y1ki6VNKY7TSSTDe/sIv1xK+LpQ8YVLgh0q4TAc/uZ2mb9+LMiLG9hwve8LGNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705609193; c=relaxed/simple;
	bh=j9PldOicSCiR56xGx4w5DlqynjyiqkkllVc8RQEib1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsPOtrCzGb35nw3rh/XGgObiToj7X3RYIDj0lVEhPkHfQq6mvBtVbEeqVTSMU90/sbXt4FXD8sWCnVqiNNhJvW0fwIJvYJrn7a6Uvg/HdZryu7Gk9r0JEPP/K9yjVPMEyXsADz72pwAZTs+LtLlVwirj9NAqAbdzpP7iZEb80N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UIKfdHXf; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UIKfdHXf"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F99060E48
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 18 Jan 2024 20:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F99060E48
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UIKfdHXf
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jMxlp5xxq2i9
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 18 Jan 2024 20:19:51 +0000 (UTC)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5B2CB60E44
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 18 Jan 2024 20:19:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B2CB60E44
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5cfaf7ef393so34123a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 18 Jan 2024 12:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705609191; x=1706213991; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/WcFOrXzi1etprpTMrc6iHqPcX21W26WmkZmedeBfBQ=;
        b=UIKfdHXft+IFjyB9/Y6sk7qWYLRDHzBN2wp6QgE4mqAN/d51owcdjegOAr4emuYLfX
         78B70E1747xKN0QWzDIQYQCOf+V5Qn03zDzofKN7ay2DvhvY2cdweZ0SHlCDVy3rpxlY
         1ZbmUaAQLZ2qtvWqKOnQfXsXnZ3NsYY7TVeP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705609191; x=1706213991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WcFOrXzi1etprpTMrc6iHqPcX21W26WmkZmedeBfBQ=;
        b=mLuves0FRxjmXo7UNZWOswYNkxyP2KUdGGf3mOT6Vy9OkuHmd8ifKzUmzUQEd9/hqR
         dx2AWxoAI+5v6T5sQopug/0VUSiFscyTfe3xgxGMIMtBlTvz87QK9yoegSQlbsS+DT/F
         9pJh5dDu+PXFzHSGI1ADNcBmVKOOZL7onznDx3eYE/47Gu66eCTf8Aov+XTYt4Yqh6ay
         ok+1MIxOmz4jdpzaZOPNrloFYCrs4+qv0JHBDxUvinbDp/tueO/fhTvbjGb8qp1cU7mw
         qiBf1vUtxGC9bhyq4PP/xBHkKPO2NlSIFH7TYalPi1qMwpMd8f6za3C5nlusQ6QXY1Ye
         oPaQ==
X-Gm-Message-State: AOJu0YxGIbjao51NyNnIeShqRUgzsae39yl9x2t/Q761IVsyNPpulfZA
	KjJ9POS0KIvwOLeJof7cJ/xWJxMc8ktIhmIg3jUgIsI+RkoxsNRUssEOHi7eGA==
X-Google-Smtp-Source: AGHT+IF4nnlVdgtVrwLuTAYy39B/0R16JlUrk6mFm918Pc2TjDWO4jFBSBuNgu+yKV55b4U9s0AePA==
X-Received: by 2002:a05:6a20:1604:b0:199:701a:4452 with SMTP id l4-20020a056a20160400b00199701a4452mr1373703pzj.9.1705609190749;
        Thu, 18 Jan 2024 12:19:50 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id fa18-20020a056a002d1200b006d996ce80a6sm3670498pfb.0.2024.01.18.12.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 12:19:50 -0800 (PST)
Date: Thu, 18 Jan 2024 12:19:49 -0800
From: Kees Cook <keescook@chromium.org>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Atul Raut <rauji.raut@gmail.com>, aspriel@gmail.com,
	franky.lin@broadcom.com, kvalo@kernel.org,
	linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] brcmfmac: replace one-element array with
 flexible-array member
Message-ID: <202401181217.1D75C32E@keescook>
References: <20230803052238.12147-1-rauji.raut@gmail.com>
 <20230803052238.12147-2-rauji.raut@gmail.com>
 <f739cc15-dade-4f69-a17a-30242026c099@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f739cc15-dade-4f69-a17a-30242026c099@broadcom.com>

On Thu, Jan 18, 2024 at 02:53:28PM +0100, Arend van Spriel wrote:
> + Kees
> 
> On 8/3/2023 7:22 AM, Atul Raut wrote:
> > One-element arrays are obsolete, and flexible
> > array members have taken their place. So, in
> > struct cca_stats_n_flags, replace the one-element
> > array with a flexible-array member.
> > 
> > This fixes warnings such as:
> > ./drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:119:6-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> I think this correct, but maybe Kees can give definitive answer here.
> 
> > Signed-off-by: Atul Raut <rauji.raut@gmail.com>
> > ---
> >   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> > index de8a2e27f49c..fff32e54833d 100644
> > --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> > +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> > @@ -116,7 +116,7 @@ struct brcmf_dump_survey {
> >   struct cca_stats_n_flags {
> >   	u32 msrmnt_time; /* Time for Measurement (msec) */
> >   	u32 msrmnt_done; /* flag set when measurement complete */
> > -	char buf[1];
> > +	char buf[];
> >   };
> >   struct cca_msrmnt_query {

Normally a [1] -> [] conversion needs some details in the commit log
about why this is safe (since it runs the risk of changing sizeof(struct
cca_stats_n_flags). In this case, there's only a single user of the
struct, and nothing about its use depends on its size:

#define BRCMF_DCMD_MEDLEN       1536
...
        struct cca_stats_n_flags *results;
        char *buf;
	...
        buf = kzalloc(sizeof(char) * BRCMF_DCMD_MEDLEN, GFP_KERNEL);
	...
        results = (struct cca_stats_n_flags *)(buf);
	...
                brcmf_parse_dump_obss(results->buf, survey);

So, the allocation size is big enough for the struct, and nothing
depends on the struct size.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
