Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F279EC73C66
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Aug 2023 15:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BF2660EEB;
	Fri, 18 Aug 2023 15:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BF2660EEB
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=iogearbox.net header.i=@iogearbox.net header.a=rsa-sha256 header.s=default2302 header.b=BHfy4LCf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-xwPGeMwPIt; Fri, 18 Aug 2023 15:44:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C498A60D95;
	Fri, 18 Aug 2023 15:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C498A60D95
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9DC8BC0071;
	Fri, 18 Aug 2023 15:44:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B3F9C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Aug 2023 15:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1262E41979
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Aug 2023 15:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1262E41979
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=iogearbox.net header.i=@iogearbox.net
 header.a=rsa-sha256 header.s=default2302 header.b=BHfy4LCf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vEBy4NPj9zRD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Aug 2023 15:44:10 +0000 (UTC)
X-Greylist: delayed 2240 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 18 Aug 2023 15:44:10 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 707CA41988
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 707CA41988
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Aug 2023 15:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
 bh=A/KGSOLlFM3RdcgifSC247nCfT6YsYA68bUMMXHTdLU=; b=BHfy4LCfPnmsXRZjJEHDsuRThG
 uG1sczdTgiQJLmP70NSYpn3Y3wb34JF/9DbtL3o7LgLOj1KPNc4Tsu2Jg4XG9gzpNIYDTzpHH0M+0
 O5Ecjbk/gPTvabb1NEG6jQEStcV+CGWjf0iCtDWIoVjc+Bt8nVrl8DteQlN3DXZCk0BZq1ZUQvV8O
 /moZ6FVxds9CTJu0fmCNkTIJb8c2npmcUaJohvAhG4/ap+WtgnKzibtDFyolbjSyNDeK4OXkl5SDt
 eKIoQZON+WROwVK/dUEkiw+3MbbhZqvtc2kWCCVDR5lj+Bb/nc3RH/AAk6vz2eNxOKIxrFZ7uYfcs
 m5Z2zrrQ==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
 by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <daniel@iogearbox.net>)
 id 1qX13e-000Hi9-81; Fri, 18 Aug 2023 17:06:37 +0200
Received: from [85.1.206.226] (helo=pc-102.home)
 by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1qX13d-000P8N-Gu; Fri, 18 Aug 2023 17:06:37 +0200
Subject: Re: [bpf-next PATCH v1] samples/bpf: Cleanup repetitive swap function
To: Anh Tuan Phan <tuananhlfc@gmail.com>, sdf@google.com, ast@kernel.org,
 andrii@kernel.org, martin.lau@linux.dev
References: <20230817154615.87967-1-tuananhlfc@gmail.com>
Message-ID: <d740be32-d6a3-b07d-8fad-0e252f18df7d@iogearbox.net>
Date: Fri, 18 Aug 2023 17:06:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20230817154615.87967-1-tuananhlfc@gmail.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.8/27004/Fri Aug 18 09:41:49 2023)
Cc: bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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
From: Daniel Borkmann via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Daniel Borkmann <daniel@iogearbox.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 8/17/23 5:46 PM, Anh Tuan Phan wrote:
> Use the macro version of swap function and move its definition to
> bpf_util.h since it is repetitive in some files. This commit also fixes
> a warning from coccinelle:
> 
> - ./samples/bpf/xdp_sample_user.c:1493:8-9: WARNING opportunity for swap()
> - ./samples/bpf/xdp_rxq_info_user.c:435:8-9: WARNING opportunity for swap()
> 
> Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>

I don't think it really improves anything. If a user takes this sample, he/she
now needs to figure out that the swap implementation is actually somewhere hidden
deep in tools/testing/selftests/bpf/bpf_util.h to ensure/audit that there's nothing
special about it.

Thanks,
Daniel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
