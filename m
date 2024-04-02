Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032F73D3BD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  2 Apr 2024 07:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712042126; cv=none; b=jqKNQUsZlGeFugqwC29IBhIJugJDZTLY0oWoDRyRAFlkApwxvysiGElq+NZpilJWPArqWii3PcJhgeBFQdQ0Zyt5b+nWpj3x33qneL+oGdDlCkdnBxsO8HaVnPEgzsDpEItsNt6qSNyMgfTTcAdcSrQ1xJ4sTWRXkZusrnLrrCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712042126; c=relaxed/simple;
	bh=YV6DYQDC3IEebm+Pxkl6Atlk7TWUF7BcjSHmxpdG2BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+XuPoqvHVHsYvlhg5Q0MKqYjJ8dz+NLJd7G7KWeMIi4TI3Q/jsrMRJss0kJdDncranE1Eg4iCbnfL9mGBypbd9MxtJVsbKGaaVr9Zm2M58BzzI7YaAkbhSvpDpJxPMIcW17ggIp6NmEJB3eNXZqZO6CuiwsxkEiCrXz8KC9hVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eln2mxu6; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eln2mxu6"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 836FA40796
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  2 Apr 2024 07:15:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_15eRzMfHg8 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Apr 2024 07:15:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=dan.carpenter@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A3964056D
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A3964056D
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Eln2mxu6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7A3964056D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  2 Apr 2024 07:15:19 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a4e83bf72f5so63087866b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 02 Apr 2024 00:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712042117; x=1712646917; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QcLmIctw5YZRqLa0BDTmesSSp3mrMTcdHK0j2v9fFws=;
        b=Eln2mxu6hFG2BIqCroC63eljvOTAncwQt13k9vsXuo4UOotSUtbOCbW+6SHq5o0H40
         VXm2Rra0mdyzm6xcUzcxqIqHaCiBgiaZkK30tcnd8IQ7J+ssE3Rzbj2PsGI0ILszVNQJ
         jX90egZEibvDz7eLGIAHJ07pNEfQUC1EIM3oOyIEcu3AxK0Xcw9/ChSql/Hzz5bxnpvo
         NO/fARB2JN+2AQY9i+rOrhYWjCM9zKdSd7im6zMvyue+aXgPE+SQEsBE0GVPL4CnBsPO
         UlYM+9ZJeDT2gYT6/a6uis0Ocs8RKuaqybqD/S7Ucayrz42DsHfbOypZMkLL2w6WE4Zg
         I64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712042117; x=1712646917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcLmIctw5YZRqLa0BDTmesSSp3mrMTcdHK0j2v9fFws=;
        b=cHlrlqRMxfudENmhxquq/iSJ7SbqsRrYFyN17aMojTqY2gbvxtJ/wO1XzQTgiKk390
         0rdZtKXmvLoEIhprXeeD5+f0lVGIAjIak4XmE73Gz6jkzueowHPOmtr7dv3FW7SqU4e5
         aepheDM3PyAUVTQJ/diqLM4GY+Aa92X+CZKgLaCQEODVYwqxovmj5gVQLaFzcbVyeQM0
         k3fc4wWLTmtOlg+r6wDzeBlyIhY17FrbhWxluMow7aZ06WAi8chaRfmt10inqgFMbLDn
         DRxmKkldoAEUceloiu9ztY6N0oO2aody82SjzZQzfaYafM0RHi9hukUpxtkdlEl/WeyZ
         FfaA==
X-Forwarded-Encrypted: i=1; AJvYcCVoxMK1rKydINncWbqN16GGEyGUBFjKhUv/1DjT787UugOYngJVohRSIyQ+5HjpqoEDEftko696Iw/EYHAxkzVySumKZnW84aZ6701PpKMxe82s1ZLvTo2hujIH9KoU
X-Gm-Message-State: AOJu0YyepXyo9mP8TOXuCH8MoSYEbXVknymi8yt1KQgCYBUCtmYv9jzm
	+EIgM9VnfAWHzoxILWYEaIfh13afnsWS3IgLIMocWrCRA5xvaXT+K7ckF3c8TDM=
X-Google-Smtp-Source: AGHT+IE/t+XdD6wZQ394SX3ykpFvfynHcDHGuPT0TNGqT3wlNCQpXzyhP3G0Pj+iSe8R3hFkGfbHEg==
X-Received: by 2002:a17:906:4083:b0:a4d:f0c3:a9e9 with SMTP id u3-20020a170906408300b00a4df0c3a9e9mr6839023ejj.28.1712042117061;
        Tue, 02 Apr 2024 00:15:17 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090626d100b00a4e1aa345f6sm6147253ejc.115.2024.04.02.00.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 00:15:16 -0700 (PDT)
Date: Tue, 2 Apr 2024 10:15:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Uri Arev <me@wantyapps.xyz>
Cc: Shresth Prasad <shresthprasad7@gmail.com>,
	christophe.jaillet@wanadoo.fr, frank.li@vivo.com,
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	luca.ceresoli@bootlin.com, prathubaronia2011@gmail.com,
	robh@kernel.org, skhan@linuxfoundation.org,
	u.kleine-koenig@pengutronix.de
Subject: Re: [PATCH] staging: axis-fifo: align arguments to open parenthesis
 in axis-fifo.c
Message-ID: <fdc25599-f8a7-4d66-9535-494de8439da0@moroto.mountain>
References: <z2ewk44rjutv24i6lqau3adrmlprj524ulqtqbncvfaj44dwcg@2dnnbm75abbp>
 <72dc90fb-79ef-4dd4-b30e-97b1e7058156@gmail.com>
 <qnljnwccqvqzilxuoat2s6md2zwcuhfruzbpepxebk65k34t3g@cyl67lk5lsoe>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qnljnwccqvqzilxuoat2s6md2zwcuhfruzbpepxebk65k34t3g@cyl67lk5lsoe>

On Sun, Mar 31, 2024 at 09:33:55PM +0300, Uri Arev wrote:
> > Oh, that's too bad. Thanks for the heads up!
> No worries, I wouldn't mind it if your patch got accepted and not mine
> :p
> I just don't think they accept patches to axis-fifo anymore, especially
> not basic syntax and checkpatch patches which are not as important as
> actual bug-fixes.

No, we're always taking patches.  You just had bad luck/timing where you
sent the patch 2 days before Greg went on vacation.

Greg is back now, but I imagine he has a long list of stuff to catch up
with.  It's possible that he also accidentally dropped your patch
because of the vacation...  I could imagine a situation where that
happened.

regards,
dan carpenter

