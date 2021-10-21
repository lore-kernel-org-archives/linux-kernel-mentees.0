Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A476C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 01:28:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A55CA61205
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 01:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A55CA61205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7840980E0D;
	Thu, 21 Oct 2021 01:28:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MnoaQZvaYCS4; Thu, 21 Oct 2021 01:28:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 77DEB83A89;
	Thu, 21 Oct 2021 01:28:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53A1FC000F;
	Thu, 21 Oct 2021 01:28:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39B55C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 01:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C09C40494
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 01:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2FGvLw_9TTVx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 01:28:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50CA94047B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 01:28:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DB096113D;
 Thu, 21 Oct 2021 01:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634779707;
 bh=zXzVqviu456oLsjo8YgHnuRG56yXJnGa0hkVNOri25c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=rpeBmLsZBoUvQBodjY8byNtkpiGhQgb70QT2QZlPyznPRYSO8nIWLqfGpRXWEUfX8
 H5tTPW6iKEaatxMBLoFfk5AviyEy83dm7feYrN3UbqQOKHflEYUiW5T56RsApYhUrZ
 VVsxxI72/M9sWX9D1CbQtWoNh2OjEYY9g9xC3dj/4NPMnb9oFLyQVyveJG1D+9BKVQ
 ITj/buz4k470ST+0bGqaDGnwvyufHyCy5dAGeRI3j4jHB2OKldS2TkCJtemfBwo1JD
 8mjCCe7a6AeJyO7GNGFLpOwxFLsC3WtwZ8Vta0Sw1uhTSBA5PDKdj2eFr0aNkZaiql
 X2D2rPtakt6gQ==
Date: Wed, 20 Oct 2021 20:28:26 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH v4 1/8] PCI/AER: Remove ID from aer_agent_string[]
Message-ID: <20211021012826.GA2655655@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <22b2dae2a6ac340d9d45c28481d746ec1064cd6c.1633453452.git.naveennaidu479@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, oohall@gmail.com,
 ruscur@russell.cc, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Oct 05, 2021 at 10:48:08PM +0530, Naveen Naidu wrote:
> Currently, we do not print the "id" field in the AER error logs. Yet the
> aer_agent_string[] has the word "id" in it. The AER error log looks
> like:
> 
>   pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver ID)
> 
> Without the "id" field in the error log, The aer_agent_string[]
> (eg: "Receiver ID") does not make sense. A user reading the
> aer_agent_string[] in the log, might inadvertently look for an "id"
> field and not finding it might lead to confusion.
> 
> Remove the "ID" from the aer_agent_string[].
> 
> The following are sample dummy errors inject via aer-inject.

I like this, and the problem it fixes was my fault because
these "ID" strings should have been removed by 010caed4ccb6.

If it's straightforward enough, it would be nice to have the
aer-inject command line here in the commit log to make it easier
for people to play with this.

> Before
> =======
> 
> In 010caed4ccb6 ("PCI/AER: Decode Error Source Requester ID"),
> the "id" field was removed from the AER error logs, so currently AER
> logs look like:
> 
>   pcieport 0000:00:03.0: AER: Corrected error received: 0000:00:03:0
>   pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver ID) <--- no id field
>   pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
>   pcieport 0000:00:03.0:    [ 6] BadTLP
> 
> After
> ======
> 
>   pcieport 0000:00:03.0: AER: Corrected error received: 0000:00:03.0
>   pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver)
>   pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
>   pcieport 0000:00:03.0:    [ 6] BadTLP
> 
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> ---
>  drivers/pci/pcie/aer.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 9784fdcf3006..241ff361b43c 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -516,10 +516,10 @@ static const char *aer_uncorrectable_error_string[] = {
>  };
>  
>  static const char *aer_agent_string[] = {
> -	"Receiver ID",
> -	"Requester ID",
> -	"Completer ID",
> -	"Transmitter ID"
> +	"Receiver",
> +	"Requester",
> +	"Completer",
> +	"Transmitter"
>  };
>  
>  #define aer_stats_dev_attr(name, stats_array, strings_array,		\
> @@ -703,7 +703,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>  	const char *level;
>  
>  	if (!info->status) {
> -		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent ID)\n",
> +		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent)\n",
>  			aer_error_severity_string[info->severity]);
>  		goto out;
>  	}
> -- 
> 2.25.1
> 
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
