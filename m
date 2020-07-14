Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CE3C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 22:02:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 892C22065E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 22:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 892C22065E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 59E618A354;
	Tue, 14 Jul 2020 22:02:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jON-awMxOjbX; Tue, 14 Jul 2020 22:02:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3E2568A353;
	Tue, 14 Jul 2020 22:02:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28E69C0891;
	Tue, 14 Jul 2020 22:02:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90A16C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 22:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7F358896B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 22:02:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JJT1KRhg8OaO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 22:02:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D8DCF896AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 22:02:17 +0000 (UTC)
Received: from mail-qv1-f45.google.com ([209.85.219.45]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MfYc4-1kX0kZ00Eq-00fz8b for
 <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 Jul 2020 00:02:15
 +0200
Received: by mail-qv1-f45.google.com with SMTP id t11so28050qvk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 15:02:13 -0700 (PDT)
X-Gm-Message-State: AOAM533ZUnMUJHqZ14GaqyNTm1wWLgwt8bE3qmeFZGWBgR2YXl/uzdx+
 T63A796W0WryvewnJ0TReGtOs00pafUFMbLFo30=
X-Google-Smtp-Source: ABdhPJznSzLhDwcnDZmpeVRogK9o+2OI/Kw97MVSd98PzQaS/otI9FtvjiXpPZMRdXNdxDurpAOdHjSmk9v+bKI3/P4=
X-Received: by 2002:a0c:f802:: with SMTP id r2mr6638892qvn.197.1594764132842; 
 Tue, 14 Jul 2020 15:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3NWSZw6678k1O2eJ6-c5GuW7484PRvEzU9MEPPrCD-yw@mail.gmail.com>
 <20200714184550.GA397277@bjorn-Precision-5520>
In-Reply-To: <20200714184550.GA397277@bjorn-Precision-5520>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 Jul 2020 00:01:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3EZX8=649R9cYF6_=ivh1Xyrgsc5mUtS=d5yvQ3doZaQ@mail.gmail.com>
Message-ID: <CAK8P3a3EZX8=649R9cYF6_=ivh1Xyrgsc5mUtS=d5yvQ3doZaQ@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
X-Provags-ID: V03:K1:w+r6XGGyn2WXpgd2HfZeetfjoUlSTYA8CYtz4AUYnIDbfeP95H3
 ulV0XZ2Xzs8htni+OojSvJ9WxM0fgkeFWh8mAcRhPcTKOnSFt6elcqlIZ5/FAQwR5jqiYG6
 YYD42X0abuy4kW69LJhECqSZ9vVlijaZmG7G2gheQIoNaaMI+YY33mt/sa9oNoRjTiYpors
 poZfj+YgnG3DoPqHLepHQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8CXSXZW7Dh8=:74TPg4jHLXsZwS9LFDpU3+
 F6FfK1JmKw/iSCBgpdk9iqpZTIxBXFgHi4m73qbQi/0fcCyjG/dg2cBan8u10pyxi8CZgSMCm
 vgDhoBb254tLkuEs9aaoN2x+fvgt8q2HzvMsDnUJdg8UFDh2DdrZBSpoQ5bQsxR2qa6AlQOK2
 NHy24xIfEtssKJEsFXop/jCFH0Q3WMp27Su2UvBxQ7Beu1+Gzb+Fi+U+sCkEqwPzj6NyXTD3+
 e0ksg2kYez53PR6YtQnOthlwFATKXLBLDZB7HFUkTx3E2bK/L4iuAnp4eKeglVgeDzlaYioxh
 hykYnn6Y5LPrvScbCJWqF6H12kAtxpkB/TQ1tt2Tee9zH3Yzk584K+uC9TtofR3fLL7PgaCuU
 SfAiiyVK8lqWhRYIDz9vHWIhzW0k3obv4ANoBM6ttaTAMB1WLV0w8bY+xVZw0XHSWXiMyVszc
 +QbPnLtibpnWUY6xlqg1eHmzyt6Tv7FxjDFzw5KUBuIb58ePC4ooloIYv4XDMKnK5rars8dkA
 BT8MPMRvCCQyM39SiIIVL95APMF+2Stm5I0TYvab//zPm70CYxgBUNv68cYTndOon1yvwNZZn
 lcYDx9LxmNxBJy5sqY6+pwf9Ua6l+YSI9bsRz1ZKe8kPP+qlbwZBHNgUtp6DmewtBJPvTpzXa
 r/eUhStMGjhtEm+6C0PvYMUrJ/lDKDZmWEFnL5oLZ/WT2kOnVmAeXPNUvIUvV876uQS8AP9RP
 0V3zsQKjIa9TCmulteTAJtd5yzfWwi3qH5dHygmTYKo6HpCmuc2j+IA9R8IT9+w0LiQMfEo6N
 XivUKBTVEHQY+ILQ9UVIYBSAMMXvn5onelErvRDVyrkoE7qFYP3tjNieul2tipo1tq1hQ1V1O
 hWiSscAFjJ4u97RN1uPXPKOdBBPyruR9XeQh7b2TFLzfk8aNOh8KTIe75n/4dXbhycm/byssW
 isJscgJK9Xo4vVNdslJYrQTa0+XLP6xnEjtetdOG95ATIAQI9Lo5b
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Keith Busch <kbusch@kernel.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux <sparclinux@vger.kernel.org>, Toan Le <toan@os.amperecomputing.com>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sagi Grimberg <sagi@grimberg.me>, Michael Ellerman <mpe@ellerman.id.au>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christoph Hellwig <hch@lst.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-pci <linux-pci@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Matt Turner <mattst88@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Guenter Roeck <linux@roeck-us.net>, Ray Jui <rjui@broadcom.com>,
 Jens Axboe <axboe@fb.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Richard Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-kernel-mentees] [RFC PATCH 00/35] Move all PCIBIOS*
	definitions into arch/x86
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

On Tue, Jul 14, 2020 at 8:45 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> On Mon, Jul 13, 2020 at 05:08:10PM +0200, Arnd Bergmann wrote:
> > On Mon, Jul 13, 2020 at 3:22 PM Saheed O. Bolarinwa
> > Starting with a), my first question is whether any high-level
> > drivers even need to care about errors from these functions. I see
> > 4913 callers that ignore the return code, and 576 that actually
> > check it, and almost none care about the specific error (as you
> > found as well). Unless we conclude that most PCI drivers are wrong,
> > could we just change the return type to 'void' and assume they never
> > fail for valid arguments on a valid pci_device* ?
>
> I really like this idea.
>
> pci_write_config_*() has one return value, and only 100ish of 2500
> callers check for errors.  It's sometimes possible for config
> accessors to detect PCI errors and return failure, e.g., device was
> removed or didn't respond, but most of them don't, and detecting these
> errors is not really that valuable.
>
> pci_read_config_*() is much more interesting because it returns two
> things, the function return value and the value read from the PCI
> device, and it's complicated to check both.
>
> Again it's sometimes possible for config read accessors to detect PCI
> errors, but in most cases a PCI error means the accessor returns
> success and the value from PCI is ~0.
>
> Checking the function return value catches programming errors (bad
> alignment, etc) but misses most of the interesting errors (device was
> unplugged or reported a PCI error).

My thinking was more that most of the time the error checking may
be completely bogus to start with, and I would just not check for
errors at all.

> Checking the value returned from PCI is tricky because ~0 is a valid
> value for some config registers, and only the driver knows for sure.
> If the driver knows that ~0 is a possible value, it would have to do
> something else, e.g., another config read of a register that *cannot*
> be ~0, to see whether it's really an error.
>
> I suspect that if we had a single value to look at it would be easier
> to get right.  Error checking with current interface would look like
> this:
>
>   err = pci_read_config_word(dev, addr, &val);
>   if (err)
>     return -EINVAL;
>
>   if (PCI_POSSIBLE_ERROR(val)) {
>     /* if driver knows ~0 is invalid */
>     return -EINVAL;
>
>     /* if ~0 is potentially a valid value */
>     err = pci_read_config_word(dev, PCI_VENDOR_ID, &val2);
>     if (err)
>       return -EINVAL;
>
>     if (PCI_POSSIBLE_ERROR(val2))
>       return -EINVAL;
>   }
>
> Error checking with a possible interface that returned only a single
> value could look like this:
>
>   val = pci_config_read_word(dev, addr);
>   if (PCI_POSSIBLE_ERROR(val)) {
>     /* if driver knows ~0 is invalid */
>     return -EINVAL;
>
>     /* if ~0 is potentially a valid value */
>     val2 = pci_config_read_word(dev, PCI_VENDOR_ID);
>     if (PCI_POSSIBLE_ERROR(val2))
>       return -EINVAL;
>   }
>
> Am I understanding you correctly?

That would require changing all callers of the function, which
I think would involve changing some 700 files. What I was
suggesting was to only change the return type to void and
categorize all drivers that today check it as either

a) checking the return code is not helpful, or possibly even
    wrong, so we just stop doing it. I expect those to be the
    vast majority of callers, but that could be wrong.

b) Code that legitimately check the error code and need to
   take an appropriate action. These could be changed to
   calling a different interface such as 'pci_bus_read_config_word'
   or a new 'pci_device_last_error()' function.

The reasons I suspect that most callers don't actually need
to check for errors are:

- Most error checking is static: PCIBIOS_BAD_REGISTER_NUMBER
  only happens if you pass an invalid register number, but most
  callers pass a compile-time constant register number that is
  known to be correct, or the driver would never work. Similarly,
  PCIBIOS_DEVICE_NOT_FOUND wouldn't normally happen
  since you pass a valid pci_device pointer that was already
  probed.

- config space accesses are very rare compared to memory
  space access and on the hardware side the error handling
  would be similar, but readl/writel don't return errors, they just
  access wrong registers or return 0xffffffff.
  arch/powerpc/kernel/eeh.c has a ton extra code written to
  deal with it, but no other architectures do.

- If we add code to detect errors in pci_read_config_*
  and do some of the stuff from powerpc's
  eeh_dev_check_failure(), we are more likely to catch
  intermittent failures when drivers don't check, or bugs
  with invalid arguments in device drivers than relying on
  drivers to get their error handling right when those code
  paths don't ever get covered in normal testing.

Looking at a couple of random drivers that do check the
return codes, I find:

drivers/edac/amd8131_edac.c: prints the register number,
then keeps going. This is not useful

drivers/net/ethernet/mellanox/mlx4/reset.c: error handling
in mlx4_reset() seems reasonable, but it gets called
from mlx4_pci_resume(), which has a 'void' return code and
cannot propagate the error further. My guess is that it
would try to keep going after a failed resume and run into
random other problems then.

drivers/ata/pata_cs5536.c: error code gets passed to
caller and then always ignored. Can clearly be changed

drivers/net/wireless/intersil/prism54/islpci_hotplug.c:
Out of two calls, only one is checked, which seems bogus

drivers/usb/host/pci-quirks.c: only one of many instances
has a check, again this seems bogus.

drivers/leds/leds-ss4200.c: called from probe(), which
seems to correctly deal with errors by failing the probe.
Not sure this can ever fail though, since the driver only does
it after pci_enable_device() succeeds first. Note that
pci_enable_device() ignores pci_read_config_byte()
errors but sanity-checks the register contents/

        Arnd
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
