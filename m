Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4FC481A1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Dec 2023 18:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAJh7U7x"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D810183E70
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Dec 2023 18:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D810183E70
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XAJh7U7x
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Owfbg8rurGBq
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  8 Dec 2023 18:30:13 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0065F83E6B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Dec 2023 18:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0065F83E6B
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d06d4d685aso18443985ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 08 Dec 2023 10:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702060212; x=1702665012; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uudr65KCGtkUzlRZuU01tlegxkyhUua9QWYMjQtjy2g=;
        b=XAJh7U7xCs5+UMU/+O/aWkRjDpLkUHCOZOTXi9ftXOXldipUOcueP1VM0omus6qhVK
         PolsYM15L6EvFkeEMg4bPdzzK02e4VLfU93YDXoPZ0UgbBEHJc+aTcvpbDkjCLfztDzC
         2OZCuc6Ecf57kB42SKTuLwtyj2Zm4ybkBUpWFBLnla/4sB9xXI2r3hbrNHXI0LPhmGxA
         UNa5SyqjX64SG7rwsIBMfsvWhh9GJCijBGsY6b7kP5lpqIGmbwuA2WUDi1p0pdSLwRXZ
         GmjzwLCKSlqee0S+hz0m4NRERCKP3i3jrIdfbGBR3mvFf4gaeC7pvxwzIZAQ7vkR5Jur
         3sCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702060212; x=1702665012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uudr65KCGtkUzlRZuU01tlegxkyhUua9QWYMjQtjy2g=;
        b=EHlYSIEKNuLJ9K64IRlPAZ9F5aSVd9ocYq1LEu5aACXUbRdV1T5Kz11kIKqPhNNgKC
         M3dz3eJk1OCa/mxYh5N1J63bJReIAyFYfTKKPtQCRtmdaR/+sJJ/dhszDT3nAMX6uNmw
         +ilkNqEACnGi0bjv/kRcBNo+ToYjbFRIVD74J0Qs1I9o7x5AW5OeYKOAbO0S0SsLM1rj
         sbcYeolQSqd3id1TYNgIxU+Pz3JeHsELd3Z75y35jh9PJhAsPvR+IRgrxOnthmNSzVk6
         pvNS92EA3hRSLyHbxCURuYUwaeHxEI1GE8MbjCpCdh9PLOlCh6KA1/Ih1hg5VcU0SAdp
         1v3A==
X-Gm-Message-State: AOJu0Yw6/xBzJOi1ue93gNmrv6+ebnsR6Y/zkurMkBTSrzIdGoBDk2wc
	7TuygtV+6jD8LAPXmvYyEp8=
X-Google-Smtp-Source: AGHT+IFSryZ38+9cBxya3IT9T9P4JUM/39pjvbHAVYLB1t4J7uZxoJrIXP5+sJrzl96OZkC7EnScTg==
X-Received: by 2002:a17:902:6b07:b0:1d2:eb13:5cd5 with SMTP id o7-20020a1709026b0700b001d2eb135cd5mr420075plk.42.1702060212244;
        Fri, 08 Dec 2023 10:30:12 -0800 (PST)
Received: from swarup-virtual-machine ([171.76.80.2])
        by smtp.gmail.com with ESMTPSA id ix9-20020a170902f80900b001d07554254esm2021457plb.160.2023.12.08.10.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 10:30:11 -0800 (PST)
Date: Sat, 9 Dec 2023 00:00:05 +0530
From: swarup <swarupkotikalapudi@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH net-next v5] netlink: specs: devlink: add some(not all)
 missing attributes in devlink.yaml
Message-ID: <ZXNgrTDRd+nFa1Ad@swarup-virtual-machine>
References: <20231202123048.1059412-1-swarupkotikalapudi@gmail.com>
 <20231205191944.6738deb7@kernel.org>
 <ZXAoGhUnBFzQxD0f@nanopsycho>
 <20231206080611.4ba32142@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206080611.4ba32142@kernel.org>

On Wed, Dec 06, 2023 at 08:06:11AM -0800, Jakub Kicinski wrote:
> On Wed, 6 Dec 2023 08:51:54 +0100 Jiri Pirko wrote:
> > My "suggested-by" is probably fine as I suggested Swarup to make the patch :)
> 
> Ah, I didn't realize, sorry :) Just mine needs to go then.

Hi Jiri,

Please find answer for some quesion from you.

1. I removed the Fixes tag.

2. I removed Jakub's name from Suggested-by tag.

3. I added new line as suggested.

   value: ## or number, is used only if there is a gap or
   missing attribute just above of any attribute which is not yet filled.    

4. dl-attr-stats has a value 0 as shown below for this reason:
    name: dl-attr-stats
    name-prefix: devlink-attr-
    attributes:
      - name: stats-rx-packets
        type: u64
        value: 0 <-- 0 is added here due to below mentioned reason
                     but mainly to match order of stats unnamed enum declared in include/uapi/linux/devlink.h
      -
        name: stats-rx-bytes
        type: u64
      -
        name: stats-rx-dropped
        type: u64

-------------- different command to get ttl_value_is_too_small with trap command -----------
   #~/devlink_work/net-next$ sudo devlink -jpnsv trap show netdevsim/netdevsim1 trap ttl_value_is_too_small
   {
      "trap": {
        "netdevsim/netdevsim1": [ {
                "name": "ttl_value_is_too_small",
                "type": "exception",
                "generic": true,
                "action": "trap",
                "group": "l3_exceptions",
                "metadata": [ "input_port" ],
                "stats": {
                    "rx": {
                        "bytes": 341019532,
                        "packets": 2401546,
                        "dropped": 48
                    }
                }
            } ]
      }
   }
----------

..... another command to get ttl_value_is_too_small trap command ---------
:~/devlink_work/net-next$ sudo ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/devlink.yaml --do trap-get --json '{"bus-name": "netdevsim", "dev-name": "netdevsim1", "trap-name": "ttl_value_is_too_small"}' --process-unknown
{'bus-name': 'netdevsim',
 'dev-name': 'netdevsim1',
 'stats': {'stats-rx-bytes': 341152018,
           'stats-rx-dropped': 49,
           'stats-rx-packets': 2402479},
 'trap-action': 'trap',
 'trap-generic': True,
 'trap-group-name': 'l3_exceptions',
 'trap-metadata': {'trap-metadata-type-in-port': True},
 'trap-name': 'ttl_value_is_too_small',
 'trap-type': 'exception'}
------------

2nd command returned stats values matches with 1st command returned stats value, when "dl-attr-stats" value is zero.

trap.c function which fills stats value fills as mentioned below:
static int devlink_trap_stats_put(struct sk_buff *msg, struct devlink *devlink,
                                  const struct devlink_trap_item *trap_item)
{
        struct devlink_stats stats;
        ...... <-- code omitted
        if (devlink->ops->trap_drop_counter_get &&
            nla_put_u64_64bit(msg, DEVLINK_ATTR_STATS_RX_DROPPED, drops,
                              DEVLINK_ATTR_PAD))
                goto nla_put_failure;

        if (nla_put_u64_64bit(msg, DEVLINK_ATTR_STATS_RX_PACKETS,
                              u64_stats_read(&stats.rx_packets),
                              DEVLINK_ATTR_PAD))
                goto nla_put_failure;

        if (nla_put_u64_64bit(msg, DEVLINK_ATTR_STATS_RX_BYTES,
                              u64_stats_read(&stats.rx_bytes),
                              DEVLINK_ATTR_PAD))
                goto nla_put_failure;

        .... <-- code omitted
        return 0;

nla_put_failure:
        nla_nest_cancel(msg, attr);
        return -EMSGSIZE;
}

but in --> include/uapi/linux/devlink.h
stats is declared as mentioned below:
enum {
        DEVLINK_ATTR_STATS_RX_PACKETS,          /* u64 */
        DEVLINK_ATTR_STATS_RX_BYTES,            /* u64 */
        DEVLINK_ATTR_STATS_RX_DROPPED,          /* u64 */

        __DEVLINK_ATTR_STATS_MAX,
        DEVLINK_ATTR_STATS_MAX = __DEVLINK_ATTR_STATS_MAX - 1
};

Hence to keep the order mentioned in enum, i assigned value of 0,
so that rx_packets, rx_btes and rx_dropped picks correct values.


