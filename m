Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142031B2EF9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Aug 2024 18:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724264590; cv=none; b=ltdXG7rjupxk3nDaMYQqW0b/RXLNZ2LCs7hqtoORpK6N0LP++ZV4cDmgd74hDcm/+nlAtRikCRqGnngl+a5KIIwhNX982+uk5FgUQYCKzAPmXT4CZtq4Lbtbas4yARXoQJn172Oikff4aUdhwJdTEIEI5YHUp6dHkPruRidh2iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724264590; c=relaxed/simple;
	bh=QUKGxRkk8/mkSrwuSlLsSbgUgk5OGBB2HN54PKBTREc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYKDw8tbrgtFkKm79qSRLKsuVGLVog7PoRB02jtmvPSNAf8yrG8Vlqyq15cKbusjHQciAbYHCIC6aik93ocoZ5nWLAr0J9aHoiQ/+dpgjtXtxjTwzE3fTduFCKqO2/gniolsWI4qv+3sgNNXXu/wetfLCpb170IsRtJCSAY0JRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IB+xOFlz; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IB+xOFlz"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B18F4400AB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Aug 2024 18:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUPSmkvqHrRO for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Aug 2024 18:23:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=dan.carpenter@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B29064000B
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B29064000B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IB+xOFlz
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B29064000B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Aug 2024 18:23:07 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5becd359800so16836a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Aug 2024 11:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724264586; x=1724869386; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0MhXaKx6yN6hoftmycyXZ+ElE9Hp5n6s8cfDPZOoBHM=;
        b=IB+xOFlzSQNPywyEYFT816ZCxHwu6zUV2thPzDY2KQipsmDCuhNTfAZA9iI5k2seWe
         yz2cSJRzDQbFRLtxcZY440L2TcRBWWsPU7g6zf5/IaRF9sCXuU7BRTQ64xvREvkF4DSW
         LR7+ZOvb8bIDYuAH67CIQhAGPaBTZbjqC6HSp9SCnQRhfWYMbAC6bxQDIbfdoWIdy7E5
         jGzSOF3vkSXwLgC56bJj7t1JZa2/TQeUR/EiS1imiKEHKnwQdOJzz1kXiricmhkwMoHj
         KqdwVkmJbl0cyU2ubLuvYgxCtaWwFFK58xM57ZkQ+1r1U6K7YlVSh5FI9g/WRuvPvaer
         izXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724264586; x=1724869386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MhXaKx6yN6hoftmycyXZ+ElE9Hp5n6s8cfDPZOoBHM=;
        b=H5jpZmJgVF3HVI2MM4/FaqFRRHq1L4CoJG5mybwsXx2Hf7523mwp07V2M1wIpC5T24
         zfW2FcEW0ZVJ1mwhxAEkDxpSLRHrtigREqMHGR4I4jvEhzzd+Z0uW9ld5uEhyhrkMMIY
         chIv7TsPF4Do1NgqFBzvQn7BnKpSL5PBHTOuGNogOPe9ND8C5UXxP3a9Z/K2PvC8ASnd
         ExTE4+ZV02WkyOhrEAoonBHgaJblupvQvrjaCmHzwSWhOM0zPMd9waflJvvj8M1/1CDu
         5Ud57Q9lBA72hB2uvtJfRk9H4KBWPd46D4v3YUO17qSipzJ7+hAjtO72IH1L5eQxNmsM
         IZmA==
X-Forwarded-Encrypted: i=1; AJvYcCVz+NPXpVucQm9LRkyybqHGVyNz7+fQbnO3mA+Viqevu2yTXYsAMUQdg2EFYx4Op+p/8x3dVeiU1bOasv1fMnSP1rLFgA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxj2ZQpZS1mSBCtRld0eVHuCuz0kX7P3nN88KxlTSwFYcESm+o0
	sHvULeAIWW8ickPhNOb8ZbvFvXhlA9EJP6qWjzFiLy7RMTn6brxQjXsDIEr7yqY=
X-Google-Smtp-Source: AGHT+IFU6t+Mu6hID3xlC+1CO1fUMB8oA7lQ5D7nMlujTXX6yhTp0eJws1S2crYlDzU/oWrgudCx+Q==
X-Received: by 2002:a17:907:ea1:b0:a7a:a3db:c7b3 with SMTP id a640c23a62f3a-a866f2d7aaamr178974666b.19.1724264585535;
        Wed, 21 Aug 2024 11:23:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838394716esm942312166b.146.2024.08.21.11.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 11:23:05 -0700 (PDT)
Date: Wed, 21 Aug 2024 21:23:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Abhishek Tamboli <abhishektamboli9@gmail.com>,
	gregkh@linuxfoundation.org, tdavies@darkphysics.net,
	philipp.g.hortmann@gmail.com, garyrookard@fastmail.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Replace strcpy with strscpy in
 rtl819x_translate_scan
Message-ID: <510b12b8-91d5-43ce-a191-9ee0a6c91460@stanley.mountain>
References: <20240820184216.45390-1-abhishektamboli9@gmail.com>
 <2348e646-e1da-4deb-ab55-c438a42e25b3@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2348e646-e1da-4deb-ab55-c438a42e25b3@wanadoo.fr>

On Tue, Aug 20, 2024 at 09:38:22PM +0200, Christophe JAILLET wrote:
>    - if a "mode" matches, do we need to iterate the whole rtllib_modes
> array? (have a look at wireless_mode)
> 

Can only one mode be set at a time?

regards,
dan carpenter

