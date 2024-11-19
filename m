Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC74145B00
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Nov 2024 18:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732041169; cv=none; b=QW7tVmcItk2ou5vFzVWRoFvO+5qgm9Vk2YWC9sHTUPPEbjqHG59VGqsyV/+I4u+W888T8QkKFNDzlTq22Koe/R+Y3Vsy35haNtNkvo5YQqNFNA7rh5hg3F5HFi7PAzlHGJmYGwGJRMI8jW0TtfiRbXzG7UI0oE0MqG8huMUG75Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732041169; c=relaxed/simple;
	bh=Q03afy1pR87I33tzLSWKBJv+Jn60qKZiCJtlfWL/f5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moHfEQW3Xp9nm9TYVEWyAhLPJPt9/l9QoZW1/c52gJqheFO0IP9C83UNgESlWjfcxd99H7cPte2z4ryp+evWVJtYNHmWmeI77bFTvrNJbbkD6aJSfqgfT09Dw+N2aobtu0lwqtHIoW/+EK6rjplqmTfDzL0x3Zmh13WFrNE44rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IxTp1XXa; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IxTp1XXa"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA06485243
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Nov 2024 18:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yHvwo_w_ldHL for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Nov 2024 18:32:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=rbm@suse.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 894068522B
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 894068522B
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IxTp1XXa
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 894068522B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Nov 2024 18:32:45 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-539f8490856so5039200e87.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Nov 2024 10:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732041164; x=1732645964; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/qujIcm++lq8ximnF/u+BvAkGZqRiSauboDwnp0tHWc=;
        b=IxTp1XXaK8FwpeVA3vPalnHdTrIS6+If0A/G7L/IkJA4EKvqqgdgHjAldY8wh7q/Bd
         rYuGsGIuiHnV3PCnss6uhrt7o2E12PEPxqUiDFsBJ7gV++FkBn99NefG/8+5zltIp1Kx
         xMvFndkj6mQ6t5WLo2OQF9dsOvE5spI1n5WljZ8ixK8/c9XvUCZKkcCCo7foTqZ5pkN7
         EHORdwaOqoMA0kdcYGYueud3ktQocye2s7J5745ptdy18ar1a8Fho810rvyXKiLkzYJt
         R7ADmUM9jsitFmL+TutrfI8gWLFM/cnqI0s6QbJlRjJHhaaUVI403EPgWUu9VEJ5OK6c
         rXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732041164; x=1732645964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qujIcm++lq8ximnF/u+BvAkGZqRiSauboDwnp0tHWc=;
        b=ohK1lE9V/qy1vciyRoCpXKCYS4GzDegPStzYGRpxKjc/vWUTES0J+KpnpVubES/Zuy
         KVk09o6MQeBnv1fN6Rq1xTOgVOcVFx9E8O1fYJ2bTtihsj3xR4j6Z7Dnr4l41sziX28Q
         v7YK9D0XPyX+BXCWjJQosqNrTIOCJRduxqQmjUCP8vK4VRTLMZV1g25/kLiPucAdS200
         jOTYwQ0OyWCWN9qAcwcuXpqIUJ8r/KcBbP7+qr2im9j8mE5Ma0WoPaR4dJX3q86MvmYy
         6x9yrJpIIMDo9TDVg8PZ4FCqp4+XRXzQvbN7/1Tp2rjathGukku7lD8ns98GMNlg+5Fy
         H45g==
X-Forwarded-Encrypted: i=1; AJvYcCUtue5pojIJHGgFbfq0zjOvANtX4HUeyC17BIkqFGVIwBOvFmp3zp6B6FEKdund4MdVINGLJMX+kIuyXFf9O15IVn9w1g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxJnNgSrKvpJFtK4a3ic0CpsrpgyKb/aUWLw1qPdNasnIbKTEYM
	y6nynIC1cZnzO3vMPozL7ilXkEfyz2UuANjkhCXgZR3MnfbQJ902WbEdnrQ5bsw=
X-Google-Smtp-Source: AGHT+IF92tJReyYtOQMdSwg2EHkEJv+Mc/gogwP8Kd1cbsMYdhOur3UCx/g98j7q2825WYgDiwOXAA==
X-Received: by 2002:a05:6512:b20:b0:539:f2f6:c6fe with SMTP id 2adb3069b0e04-53dab29cc03mr9188460e87.16.1732041163890;
        Tue, 19 Nov 2024 10:32:43 -0800 (PST)
Received: from localhost ([179.228.213.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f346d7sm77359085ad.138.2024.11.19.10.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 10:32:43 -0800 (PST)
Date: Tue, 19 Nov 2024 15:32:40 -0300
From: "Ricardo B. Marliere" <rbm@suse.com>
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	skhan@linuxfoundation.org, ricardo@marliere.net, linux-usb@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: usb: dwc3: remove deprecated member
Message-ID: <5l65sdskdzbehxamff5ax4ptiqhaxh7ewi4umtpp6ynen45nj6@nebuxjg4c4rx>
References: <20241119154309.98747-1-luis.hernandez093@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119154309.98747-1-luis.hernandez093@gmail.com>

On 19 Nov 24 10:43, Luis Felipe Hernandez wrote:
> This patch updates the documentation for the dwc3_request struct,
> removing the sg (scatter list pointer) member.
> 
> - Remove 'sg' in the doc block for dwc3_request
> 
> This change resolves a documentation warning related to the missing
> description for this field.
> 
> Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>

Reviewed-by: Ricardo B. Marliere <rbm@suse.com>

> ---
> v1->v2: remove unused sg struct member as per review[1]
> [1] https://lore.kernel.org/linux-usb/20241119020807.cn7ugxnhbkqwrr2b@synopsys.com/#t
> ---
>  drivers/usb/dwc3/core.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index ee73789326bc..3be069c4520e 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -956,7 +956,6 @@ struct dwc3_request {
>  	struct usb_request	request;
>  	struct list_head	list;
>  	struct dwc3_ep		*dep;
> -	struct scatterlist	*sg;
>  	struct scatterlist	*start_sg;
>  
>  	unsigned int		num_pending_sgs;
> -- 
> 2.47.0
> 
