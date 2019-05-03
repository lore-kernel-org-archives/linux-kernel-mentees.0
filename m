From: greg at kroah.com (Greg KH)
Date: Fri, 3 May 2019 10:01:25 +0200
Subject: [Linux-kernel-mentees] [PATCH] Staging: rtl8192u: ieee80211:
 Fix comment formating errors
In-Reply-To: <20190503075204.GB4313@arch>
References: <20190502052608.GA15578@arch> <20190502174154.GB14304@kroah.com>
	<20190503075204.GB4313@arch>
Message-ID: <20190503080125.GB14960@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Fri, May 03, 2019 at 01:22:04PM +0530, Puranjay Mohan wrote:
> On Thu, May 02, 2019 at 07:41:54PM +0200, Greg KH wrote:
> > On Thu, May 02, 2019 at 10:56:08AM +0530, Puranjay Mohan wrote:
> > > Fix comment formating warnings found by checkpatch.pl
> > > 
> > > Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
> > > ---
> > >  .../rtl8192u/ieee80211/ieee80211_softmac.c    | 66 ++++++++++---------
> > >  1 file changed, 34 insertions(+), 32 deletions(-)
> > > 
> > > diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
> > > index 944c8894f9ff..be02f73f5618 100644
> > > --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
> > > +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
> > > @@ -196,13 +196,13 @@ static u8 MgntQuery_MgntFrameTxRate(struct ieee80211_device *ieee)
> > >  	}
> > >  
> > >  	/*
> > > -	// Data rate of ProbeReq is already decided. Annie, 2005-03-31
> > > -	if( pMgntInfo->bScanInProgress || (pMgntInfo->bDualModeScanStep!=0) ) {
> > > -	if(pMgntInfo->dot11CurrentWirelessMode==WIRELESS_MODE_A)
> > > -	rate = 0x0c;
> > > -	else
> > > -	rate = 0x02;
> > > -	}
> > > +	 * // Data rate of ProbeReq is already decided. Annie, 2005-03-31
> > > +	 * if( pMgntInfo->bScanInProgress || (pMgntInfo->bDualModeScanStep!=0) ) {
> > > +	 * if(pMgntInfo->dot11CurrentWirelessMode==WIRELESS_MODE_A)
> > > +	 * rate = 0x0c;
> > > +	 * else
> > > +	 * rate = 0x02;
> > > +	 * }
> > >  	 */
> > >  	return rate;
> > 
> > Ick, no, just delete this chunk, that indentation makes no sense.
> This solves this checkpatch.pl warning
> WARNING: Block comments use * on subsequent lines

checkpatch.pl is only a dumb perl script, it can't know about
everything, you have to always take its advice under advisement, it is
not always correct.

Look at the change you made, does it really make much sense?  Does the
code look better after you have made it?  That's the key here, your goal
is to leave the code better looking and easier to understand overall.
Just indenting the comment does not really do that.

> I have fixed all trailing whitespace issues, also fixed my editor to
> show them :D.
> Should I keep the above two blocks(which you told to remove) in V2
> because they solve WARNING:Block comments use * on subsequent lines,
> or should I remove them before sending V2.

Please remove and send them as a different patch that removes commented
out code.

thanks,

greg k-h
