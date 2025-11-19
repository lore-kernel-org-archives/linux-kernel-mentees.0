Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B4032ED5D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 16:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763568626; cv=none; b=Q0g7mmKS63Zs8s4IP35vDZyrw+sDFHvK1UH9WLYxL7G0qglsg1vSVuVEdcACIUCvr317f0vvNLZeod2GnXtBgGQgQaE8fegO9FeahsEsZyaV5Jv09oPsBi/KtI4P5wQ0vM1rRXEDYZe76vZPIqZRxH3iTxCFRCzjqRAbad2wWyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763568626; c=relaxed/simple;
	bh=mHmSBdBUMsM98MKMQ16j1/Bj/dx65pntHMGDTY2scS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASKSno9+oejS+uqKlybSc49ElaX8VXkxBizveATQZu1RLAd+Tw/pCXCLaENXciX6YPFVksOPUsYaBVHTJR3rBG8Zij/JPHsqosxksEHvMT02gNY1MNxI2oqXv/bUMq5I0YmpTKD3du5UsFEQ8Jo2y2n58//AI3uQgrPDDV+dX8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=esvczAIY; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="esvczAIY"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60F73403DD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 16:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.898
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SVwvVScxYNMh for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Nov 2025 16:10:23 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=jiri@resnulli.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C838740278
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=resnulli.us
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C838740278
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=esvczAIY
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C838740278
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 16:10:20 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b7355f6ef12so1224140066b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 08:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1763568619; x=1764173419; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=obMO0wYPRukfGEWb9Ik5Mm0Kc6J6YzvOIw86E9DCTVA=;
        b=esvczAIYEXmgyais2r+RzdOal2Tl/c4Rtn3qPZiR2UYNwiz1vT7lQKE2RH7bPNKBeK
         ZUnoyfJRYAHjbW6ibvAbBqbw+Ccg0jn0lULPQl+U6CJHUvYFJDoZlasBathaRBZXJkGe
         fcx6BI3rq3nAreySQ5Wpj3mQY26glesCL0Pi5dSpc4iVaokSdonrvL/ffXTKv6SfLiRG
         OmANME5/BYMwzCidaC4ajfs7ntf4Pl26vuLS1kbwkUG4JYB/BTy7bXpXlem1HXk+Ey47
         BpnJUG1NdghONpvfisrZn0Au6ouU9ZAZhdktJlV8t8HBFJADpYgiLUuaKAaRs2umHm42
         lxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763568619; x=1764173419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obMO0wYPRukfGEWb9Ik5Mm0Kc6J6YzvOIw86E9DCTVA=;
        b=ZCLnN5BkeXDD1kwsjz2tZoZbgEDv0OALus/LYftG4ELzvjhXHjw0LjALqvQ72LQXHA
         su0zTXbQvmBm6MDCMcWi6E0yQ0H+zNACGDa/FMOuRQfzEvty3rFA3GuOpc6gP16sniHQ
         zD+M/2ljEbYC/Jvofhc5+UbOSYZfb8dV6mDEIWlqSUxpFRQlxV5bya20f41hkhYF+/b6
         pKDIoFL22umwtZ296PAjTBv2uFiJxomzZgTd+0g8AmIm5EXNUcgdTI2rGz2wgvPDyvFF
         9M889ZkI4MAT0O6+QQE2JMTSX+z+D/k5ufLpypOzsqhtZjIzeB/TDh1JbkcqMbBW9bZ0
         V+4g==
X-Forwarded-Encrypted: i=1; AJvYcCVcx8eMzLdwMe02hK2jpeyDd+nOUAp3ugDN8l+9OBbQXD45bCY9Re9iIdxlMuuKPUWXqbbo0oPKKxVFH0u7MA9cPVX/jg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxd8xmCbhb1NZE/M/xTdClZq4znPBRG9CmMdFWhJCvSuZH+LPys
	lI8GL6nvZRsdAoVdB3MXvTz5rm3caYtE/Fv87Q9cpDPfgf+R+cNURt4BkfgI+Q6iC5s=
X-Gm-Gg: ASbGncthc0kNOPqQaCrjN7cEWDhQr3fXgwQW3kkGXykdUaa5e+/KqKxf6fqhnian4bO
	wUyv35bvMNbGj7kkRKHCgfiA2VMOG2vbRO0BroJwlxc6ZBxFC3p+Fqur85pvQ49MqHDuZ/ue1fl
	R0K4qGzERgIssjUCtVSpQOHat4IQgAugkYrWt9PlpiJ2WWfvXd39+L6fJDnfyvg38h5pvoOsbRv
	SO/gNvs557VkJz/iwkINCGTYHm9W5acdoEQ9sq2VXdPpQZDqPoKP5as85uNTIlCtmE33M4SLq+m
	KA8ePrbrDUYpDXhEg/tnRZ+VO1vQZ7J0Ems05CIWZz57Iq9U9V3oLlWcg92IbvP/Uik0LbeusnZ
	RjmRfsCdEZfTQ9tb5GffGOWel+WafOVbGBPeOd6spJa1gsRIcjfCH9yMarSRa6UKod/v8nglwDO
	aSj1dDWaqkL6kok61SKYOSXdo=
X-Google-Smtp-Source: AGHT+IEXAArin/coa0GZgSrEav6MLboqNEKcMPid0tRL7uyYDaIetyaKZwreOBItTdMx+ON6Mg2+iw==
X-Received: by 2002:a17:906:7d0:b0:b73:74d6:d360 with SMTP id a640c23a62f3a-b7374d6d4e3mr1534730966b.40.1763568618474;
        Wed, 19 Nov 2025 08:10:18 -0800 (PST)
Received: from FV6GYCPJ69 ([213.195.231.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad800dsm1664562866b.29.2025.11.19.08.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:10:17 -0800 (PST)
Date: Wed, 19 Nov 2025 17:10:15 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Paolo Abeni <pabeni@redhat.com>
Cc: "Nikola Z. Ivanov" <zlatistiv@gmail.com>, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	syzbot+a2a3b519de727b0f7903@syzkaller.appspotmail.com
Subject: Re: [PATCH net] team: Move team device type change at the end of
 team_port_add
Message-ID: <mekjl7qqrb6nkk6ru4fztqxzemldzbsplf5tzuu7amc7yaa5j3@rulh6ijsppaq>
References: <20251112003444.2465-1-zlatistiv@gmail.com>
 <c6fa0160-aac6-4fc4-b252-7151a0cb91d3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6fa0160-aac6-4fc4-b252-7151a0cb91d3@redhat.com>

Tue, Nov 18, 2025 at 12:46:36PM +0100, pabeni@redhat.com wrote:
>On 11/12/25 1:34 AM, Nikola Z. Ivanov wrote:
>> @@ -1233,6 +1231,10 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
>>  		}
>>  	}
>>  
>> +	err = team_dev_type_check_change(dev, port_dev);
>> +	if (err)
>> +		goto err_set_dev_type;
>
>Please don't add unneeded new labels, instead reuse the exiting
>`err_set_slave_promisc`.

Well, that is how error labels are done in team. "action" and
"err_action" is always paired. Why to break this consistent pattern?
