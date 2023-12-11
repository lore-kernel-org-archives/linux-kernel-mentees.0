Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBAC2137C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Dec 2023 09:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="J2wqU7nI"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1B6D81BB4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Dec 2023 09:46:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1B6D81BB4
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=J2wqU7nI
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.898
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gl926xF9SRTR
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 11 Dec 2023 09:46:22 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7F3C681BB2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Dec 2023 09:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F3C681BB2
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a1f8510883aso225345066b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Dec 2023 01:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1702287980; x=1702892780; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xei4Fs8F5vzG7GSLsaxIgBQ24qq9i/olJ2HxLT2JYFc=;
        b=J2wqU7nI6V4sIdT1zNBU4r9mNI2axaSrU982sOeCKsQ2Dd8VFYXt8wqGho3DKE91SL
         s9f7DV992XEhi3tKCr00CNTmOPLUzzf2saHgahIltOh3aV6H3Muv3C9cSI+0+rRdDhEh
         w8HNj5/9518QO+/W5RnqFcV/ZFYoY63DoVkArKttOQigpvH2wDA7nST2K1D602hYhN4o
         CyYWaTZXtBHzW5xMux5ZMzX857RNscUDGZYczLxuS4m14FrtuySqrVEZQ0PQnA7eV7tY
         c87uUw86dEl2DeyC12UKtb9/baSMwgmDsBp60ACAABT6wp2Z0wLmvq6E+m3b6OpRlUo4
         XC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702287980; x=1702892780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xei4Fs8F5vzG7GSLsaxIgBQ24qq9i/olJ2HxLT2JYFc=;
        b=DcML673ruNl5nDEZRllqzov6YHVLxbfovTWGPhow1wc7O7OisljInadZprCE5tckyy
         OPqvorAxxSu+O0TzwDclVO0ozLGRYNngw0sqQLAk9upecXuMaEL0JSZacw0X1a6F49I3
         8HEYtHGopIgc41x8wVY17a+23wGETwpY4oppvHKfPP6EBwDSHLuBUSlKQtllkSb95pJH
         dOpb40gF0poOrNxrrCXZEPM7jQt4WnOJCgtGf95tdzSNDzV6j44lxarK1NYAKbiPWwLW
         Tk2bQlRjoPhs3IHXrtVZZNupZkc1Dk5lNf/YET74mW4vE5Zdw5qEpCncxNulD7vqqgYK
         K8GQ==
X-Gm-Message-State: AOJu0YxYgh4UKHN4o3bmDDlim3+9ci+/L7CIn4k1dVVw0dwXGWpPoKMW
	zmzZtrsF3gS4mg6EpgIcBKUUbQ==
X-Google-Smtp-Source: AGHT+IH/K8msY+Sd8aEiV+oXlbYQSc+VUqKsR26+d+2xoowNlOE/ijN2E9cdEpChMNvpYfOGO0B4ag==
X-Received: by 2002:a17:907:6d21:b0:a1f:6644:602b with SMTP id sa33-20020a1709076d2100b00a1f6644602bmr1337675ejc.59.1702287979826;
        Mon, 11 Dec 2023 01:46:19 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id cw15-20020a170907160f00b00a1937153bddsm4508049ejd.20.2023.12.11.01.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 01:46:19 -0800 (PST)
Date: Mon, 11 Dec 2023 10:46:18 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH net-next v6] netlink: specs: devlink: add some(not all)
 missing attributes in devlink.yaml
Message-ID: <ZXbaauFOfttLCe78@nanopsycho>
References: <20231208182515.1206616-1-swarupkotikalapudi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208182515.1206616-1-swarupkotikalapudi@gmail.com>

Fri, Dec 08, 2023 at 07:25:15PM CET, swarupkotikalapudi@gmail.com wrote:
>Add some missing(not all) attributes in devlink.yaml.
>
>Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
>Suggested-by: Jiri Pirko <jiri@resnulli.us>
>---
>V6:
>  - Fix review comments

Would be nice to list what changes you actually did.

Nevertheless, patch looks fine to me.

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
