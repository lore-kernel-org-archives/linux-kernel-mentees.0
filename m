Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D363E176FCF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 14:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726152649; cv=none; b=rhI/F2iNqM0zZI3FNWFGuuxwSAHR2LioVu0R29iFyqu995f1sn2eprst03t53ug1KrEMx9I1dDjGTrv/d4gas1iumLGdvHCRbgLRH78JY9ILzxZpKVJ3pguNPCcddLC3OmkTI+0lgxeIOXcjwIcCoRglTKG5GjXK1KmhbN+U+QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726152649; c=relaxed/simple;
	bh=ayH+utA3EDdkSrZkZF7fyyNHjV7s38pbI+F2Y0qcPcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6RXi+cQc6oq8I5EOe6ha/2txj5JKz3cjyhHlJlItHh2qBhJ4q6MsB1+uXy4aQisckUewLH7RyUmkOWNJpP/t4XlBC91EayOOGwzqkTkgV1R1NlHkj1Nt2auzRATsDIznlKNcREF5jArvp85TlkJfjJX99hq40TLNoH0RN2iPGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZWCLHQ/; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZWCLHQ/"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EC1A81EB9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 14:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JMHUfC8AVzNS for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Sep 2024 14:50:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BCBF581EA2
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCBF581EA2
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GZWCLHQ/
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BCBF581EA2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 14:50:46 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2d88690837eso867798a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 07:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726152646; x=1726757446; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L/1O0y+ZcovBucCacZFimGopfgJW1W3kqGSazoLLM6M=;
        b=GZWCLHQ/lMXQVrk/TOC9Zg/3KI/bL6mVFZ3ywj6yKuGWWBfEckC647AzbW75KKOYe+
         TTc7x4DDYGQCIkeBCnhF5Szf2FJc4ThBpMahNKEC31VMODO8Ut0epMWJ0VUbfDi0rsDP
         Y3B2Gt//WlzuMOhVegvdxkZRgOZG0mOG9pMJRwbendTXL0Z+Pr8W8SZ8JqR4vOZzReHg
         oDlyLX1fQUcz8RorJLGbWaIx92y95R/kQD9CTM+vOBcU2AVKyqO1Dc/diZY9YB+cHL0h
         9QeesjI2Q5qVhmHEK7jpOobA1QjGu+JmDDzYUoheZz+uD+jIWwStKRFRyizDC7jkYw82
         0HkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726152646; x=1726757446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/1O0y+ZcovBucCacZFimGopfgJW1W3kqGSazoLLM6M=;
        b=PnE4DcqfSz0FXF/5n9GGKYWcXU97mJjMgDgK1tJhmvhRiamAxqVDlsZx25hOrKckdj
         nU/stkvZj86R9QQ9K2DsIwSQ30GGDV3xFvvY1ketmhWeWFfnAyO+HDJQ2JvC0pBJEHUr
         g9jEaZib7Io7XmDqGmSs7Z7rHTlTA8gHgUXfnK35S2RpQZWgmQj9JJuthPrNi7Diq6aH
         VOnJRZoMMEfP1eZ6wM/c83mz45S6RYYzv/xxLer7aUNQuuk4EuKvKSnbPMebdiz+J8V5
         G6Ze75uZh9lG0815haKZxwPWIBv7AIZXdcRutiahO1guP8zsEzKmFVZI1uuJmnfJ9Y/g
         v1Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVTppeOXavAhiwjq7qkV0IEI2tSluY9y2NIeoNC5jwOBjKNTXHCVSYRtc1qeP49itF4dQ9G6uelhKOeC/YFtb1Lnsr1Ig==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz3OYP6aWTy/eQND9MLsqGC98NLUXlZ3kq7UYx4w8bJYBuKS3JH
	TuistqRixCxVmdA+cNL3j/Rcer7/ikVNCQa+xHjfusYNPaOLS45y
X-Google-Smtp-Source: AGHT+IFjcRQsP50gGkz963RmfFpuknI+lDTIV0qWQ9uuKZptDHcTYTXmrlSqWc2zir8P9uH9bkiq2g==
X-Received: by 2002:a17:90a:9308:b0:2da:d766:1925 with SMTP id 98e67ed59e1d1-2dba007f632mr3535363a91.37.1726152645657;
        Thu, 12 Sep 2024 07:50:45 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.232.184])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadc040397sm12678925a91.25.2024.09.12.07.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 07:50:44 -0700 (PDT)
Date: Thu, 12 Sep 2024 20:20:34 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stern@rowland.harvard.edu, usb-storage@lists.one-eyed-alien.net,
	linux-usb@vger.kernel.org, skhan@linuxfoundation.org,
	dan.carpenter@linaro.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: ene_ub6250: Fix right shift warnings
Message-ID: <ZuL/um0Pcm8o3Gox@embed-PC.myguest.virtualbox.org>
References: <e72cc56a-3066-4cb8-848d-bfe27a48c095@suse.com>
 <ZqkpOQIjcBSAg8rC@embed-PC.myguest.virtualbox.org>
 <5d7870b0-6b63-430b-8885-2509b33dc78a@suse.com>
 <804a6d40-73a4-4af6-944b-95e9324d7429@rowland.harvard.edu>
 <Zqp8vbbIC8E/XrQY@embed-PC.myguest.virtualbox.org>
 <b35a344a-018b-44ae-975a-7767a3d5b6ec@rowland.harvard.edu>
 <f5d4711f-9b4a-457c-b68c-c2e9aefbe4a8@suse.com>
 <890e0ed1-25c3-414e-9e8e-f5925fe8c778@rowland.harvard.edu>
 <ZuI5nptdk+BcXh+R@embed-PC.myguest.virtualbox.org>
 <2024091228-bootie-name-4867@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024091228-bootie-name-4867@gregkh>

On Thu, Sep 12, 2024 at 07:06:45AM +0200, Greg KH wrote:
> On Thu, Sep 12, 2024 at 06:15:18AM +0530, Abhishek Tamboli wrote:
> > Hi Alan,
> > On Thu, Aug 01, 2024 at 10:51:35AM -0400, Alan Stern wrote:
> > > On Thu, Aug 01, 2024 at 08:54:18AM +0200, 'Oliver Neukum' via USB Mass Storage on Linux wrote:
> > > > 
> > > > 
> > > > On 31.07.24 20:19, Alan Stern wrote:
> > > > > On Wed, Jul 31, 2024 at 11:34:45PM +0530, Abhishek Tamboli wrote:
> > > > > > On Wed, Jul 31, 2024 at 10:04:33AM -0400, Alan Stern wrote:
> > > > 
> > > > Hi,
> > > > 
> > > > I should make my reasoning clearer.
> > > > 
> > > > > > > Replacing the variable with a constant won't make much difference.  The
> > > > > > > compiler will realize that bl_len has a constant value and will generate
> > > > > > > appropriate code anyway.  I think just changing the type is a fine fix.
> > > > 
> > > > While that is absolutely true, it kind of removes the reason for the patch
> > > > in the first place. The code gcc generates is unlikely to be changed.
> > > > 
> > > > We are reacting to a warning an automatic tool generates. That is a good thing.
> > > > We should have clean code. The question is how we react to such a report.
> > > > It just seems to me that if we fix such a warning, the code should really be clean
> > > > after that. Just doing the minimum that will make the checker shut up is
> > > > no good.
> > > 
> > > With this fix, the code seems clean to me.  It may not be as short as 
> > > possible, but it's clean.
> > 
> > I noticed that the patch has not yet been pulled into linux-next, 
> > even though it has been acked-by you for over a month. Is there 
> > anything else I need to do on my end?
> 
> Yes, please resend it, it is long gone from my review queue, sorry.
No problem, I will resend it.

Thanks,
Abhishek
