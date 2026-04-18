Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39555332EBA
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Apr 2026 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776508040; cv=none; b=kp7dn5TaYErFxfqknjzKvL6T5w7akfb/568iFnelC9uDWg1Ccvlq6DADLzJ0lDPnnHf39MmWWqUUNVbRQVlIrY2SR2w44KDZ/blTQiMQ1h/FmpKqjFlS0w4GoFW50Z83xLrq9KbU6TqO5VAUALVPpzG70GvYR1mTrk7JEz4PGzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776508040; c=relaxed/simple;
	bh=lbvp+q6Ee1jXl/JddiYXx2sw6/NvDwxJUd93EGYKAco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HiZ3NWv44Ta/aEhP3WNS6pKGW1tRXWjNbL63DrTji+fb4YFpoiR/7CcXHSqTZauYYEPTS6WSjadSsVFjwfouhLLvPiXvGqY9+W0w6FfnqcrLRPjvdXhJrat8w4D2Q+LHlWBLyVDi0/cXAolskr+V9Fq4ihZEfQsP+/A9skENX6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QpMEyjQR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QpMEyjQR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48374014a77so17909555e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Apr 2026 03:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776508037; x=1777112837; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBNI4EdgBnERH0JRaIrNWQCvhm/8BjKu3aOv53OQCzU=;
        b=QpMEyjQRWBrwmg3NBL3fpZq41jyaJ0TCg2dj0Wgxvn/8NN7yUM0gKx1c1hfD9QY2G3
         2Ek/1Y1s/jfVZu9uzKxQ0D6u8O8z67NvBH/gG+x1E8NGXznCwBx/0Mhb6SneRx6jT/xG
         Du++JdpJR2U6k5rJto8tuK0V4RE3aWBanzlt+JVIi/L/fMiWhV9FUYzPPrZ11Gtrjgzk
         XTEu8mBTC+vudcI1jL/F7ddVrhBOkU/6C2jZ7+UOMNZJERiQFZ6uDZnNO5dNPIq/zwRX
         BmkVSLPYHIlxqU+cde4Yljw7zr0UyxOh1yhLxkp/CAFeTVWO/YrtZGg7jtEg0nPYv9vd
         Vafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776508037; x=1777112837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBNI4EdgBnERH0JRaIrNWQCvhm/8BjKu3aOv53OQCzU=;
        b=B3KLhI9j4d4mYF/nxKYcvSDHWw/UghK3+WZDVteHk1GBxpSzs+mb8KiEM9MXXXTHP4
         br6lG+pL0hcIjmh8eBa2caA5Q+jFcMLjmacOiViV4B2VOpJ3pvi0hlY2JmPfX1xPrs0/
         lMLICZHJ544Hc2jHIm+uPzJFlR51NbzKETOJHFgchUi8P4bLov0tCvGsy7P1dMhSIbuf
         hu7Da+nwPVXPcu48wD7WcmGyCyUX1vddEZThZ881FS7Yp4Fu0pzMTq41AehUXB/m0K2r
         8uHI8Omk661KVMgAiqrPeoexLJg0lpg8pVz6JpO8q145TmzpJEvojgNjmnsw9m6e1rbl
         qNGw==
X-Forwarded-Encrypted: i=1; AFNElJ91Mxk+TN/I4t/nAO8lh3+WECtysv2zrIi8HiuCEK8UCVSszQqwE4al2KwT1GWZVhU85c5jI0zgzmKiuLSv4Ph8Yzi0nA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzl1weeHns3IsWP1DcXE++ztuCBrPr46ApE25hIj9Yj5i/ZzypO
	feKtcdSEV1Fy6vIvwdIhakKqCYHWkklzIZzWL/AiZBx1qTUhTZZs1+LbyvrK7w==
X-Gm-Gg: AeBDieu+9m8FdnuY/+Wd6roMy6wMiu4gi9qTb0VdIJBn3cWS3EqEmk+yZO71OR4GgEm
	bcyT1g56zJkq0TTdzVdDg4bmshV1eSmTEI4afuIpiV7MFlxreRR4jdL3wrkCbXF5hSXoTLtoQy0
	jLDeiGge3DWzbaHO7Qconu4x6+tYV9Vl+H/g3r6wWakFZ1yuGoRmIPDT8fpu20H/gxiY1PNH/ZW
	ZaAAMUbW5IIFm9GjZCo9EW//Yf7tonW8RADdB2bIwjKaf6zN4JEYPadIR9YYgZP3IST9N6fAoDP
	6iTAQ4PjgcfJMud4KqvDJraOfg1oZVtg6ml+bSSysTkAgawvEb5oX0qzz3jGuhCJw0Twt61iMq8
	iUImTofm+1rlWrQR0bMAczIsMgF73GWVcwE/EbE6NRpj+aXahloKKUWPRNyTHxsbK4HpMGSZKW7
	x7+4StwQN0BP2sSBhByw/QYQ5Laa4qLA==
X-Received: by 2002:a05:600c:6089:b0:488:e192:6fb5 with SMTP id 5b1f17b1804b1-488fb7887camr88648135e9.24.1776508037427;
        Sat, 18 Apr 2026 03:27:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1682sm12499160f8f.1.2026.04.18.03.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 03:27:16 -0700 (PDT)
Date: Sat, 18 Apr 2026 13:27:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	linux-newbie@vger.kernel.org
Subject: Re: [PATCH] Documentation: adopt new coding style of type-aware
 kmalloc-family
Message-ID: <aeNcgSu8kVEyWbzY@stanley.mountain>
References: <20260418093101.130335-6-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418093101.130335-6-manuelebner@mailbox.org>

On Sat, Apr 18, 2026 at 11:30:48AM +0200, Manuel Ebner wrote:
> Would a patch like this one make sense?
> I think i need help with the change log. Is there something to much or missing?
> 
> ptr = kmalloc(sizeof(*ptr), gfp);
>  -> ptr = kmalloc_obj(*ptr, gfp);
> 
>  This one is done. The ones below are not done yet.
> 
> ptr = kmalloc(sizeof(struct some_obj_name), gfp);
>  -> ptr = kmalloc_obj(*ptr, gfp);
> ptr = kzalloc(sizeof(*ptr), gfp);
>  > ptr = kzalloc_obj(*ptr, gfp);
> ptr = kmalloc_array(count, sizeof(*ptr), gfp);
>  -> ptr = kmalloc_objs(*ptr, count, gfp);
> ptr = kcalloc(count, sizeof(*ptr), gfp);
>  -> ptr = kzalloc_objs(*ptr, count, gfp);
> 
> change log:
> [PATCH] Documentation: adopt new coding style of type-aware kmalloc-family
> 
> Update the documentation to reflect new type-aware kmalloc-family as
> suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj() and family")
> 
> ptr = kmalloc(sizeof(*ptr), gfp);
>  -> ptr = kmalloc_obj(*ptr, gfp);
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Yeah.  Fix up the commit message and that could probably be merged
through the documentation tree.  Probably no need to split it up
by subsystem, but you should CC the affected subsystems.

regards,
dan carpener

